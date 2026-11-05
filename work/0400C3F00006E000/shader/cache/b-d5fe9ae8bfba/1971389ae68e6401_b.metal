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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_57 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _442 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_108);
        out.gl_Position.z = _2028;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_144);
        out.gl_Position.z = _2096;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _174 = _168;
    float _176 = _170;
    float _178 = _166;
    float _196;
    if (!_172)
    {
        float _180 = in.m_51.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _126 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _264 * _252;
    float _276 = _272 * _252;
    float _278 = _270 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_53.x;
    float _324 = in.m_53.y;
    float _326 = in.m_53.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _286 * _322;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = _376 * _358;
    float _390 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = -_376;
    float _396 = _394 + 1.0;
    float _398 = _386 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = _290 * _326;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _420 = _414;
    float _422 = _416;
    float _440;
    if (!_418)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_92);
        float _446 = 1.0 / _444;
        float _448 = _126 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    float _458 = 1.0 / _354;
    float _460 = in.m_51.z;
    float _462 = in.m_51.x;
    float _464 = 1.0 / _352;
    float _466 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = 1.0 / _404;
    float _470 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _472 = _454 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _476 = _454 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _478 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].x, _474);
    float _482 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].x, _476);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _494 = _488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -_490;
    float _498 = _496 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = -_492;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = -_494;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _508 = _498 * _498;
    float _510 = fma(_502, _502, _508);
    float _512 = fma(_506, _506, _510);
    float _514 = rsqrt(_512);
    float _516 = _502 * _514;
    float _518 = _506 * _514;
    float _520 = _498 * _514;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _524 = _516 * _522;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _518 * _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _532 = _520 * _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _536 = -_524;
    float _538 = fma(_518, _534, _536);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _542 = -_528;
    float _544 = fma(_520, _540, _542);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _554 = -_532;
    float _556 = fma(_516, _552, _554);
    float _558 = _538 * _538;
    float _560 = fma(_544, _544, _558);
    float _562 = fma(_556, _556, _560);
    float _564 = rsqrt(_562);
    float _566 = _458 * _548;
    float _568 = _464 * _546;
    float _570 = _468 * _550;
    float _572 = _460 * 6.283185482025146484375;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _578 = _538 * _564;
    float _580 = _544 * _564;
    float _582 = _556 * _564;
    float _584 = _574 * _466;
    float _586 = _518 * _578;
    float _588 = _520 * _580;
    float _590 = _516 * _582;
    float _592 = fma(_126, 0.310000002384185791015625, _572);
    float _594 = -_586;
    float _596 = fma(_520, _582, _594);
    float _598 = -_588;
    float _600 = fma(_516, _578, _598);
    float _602 = -_590;
    float _604 = fma(_518, _580, _602);
    float _606 = _584 * _596;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _610 = _584 * _600;
    float _612 = _584 * _604;
    float _614 = _462 * 6.283185482025146484375;
    float _616 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _608 * _470;
    float _620 = _592 * 0.15915493667125701904296875;
    float _622 = fma(_126, 0.10999999940395355224609375, _614);
    float _624 = _576 * _616;
    float _626 = fma(_618, _578, _612);
    float _628 = fma(_618, _580, _606);
    float _630 = in.m_57.y;
    float _632 = _620 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = fma(_624, _520, _626);
    float _638 = _622 * 0.15915493667125701904296875;
    float _640 = fma(_624, _516, _628);
    float _642 = fma(_618, _582, _610);
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _646 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _648 = _638 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(_624, _518, _642);
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _656 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].y, _646);
    float _660 = _490 + _636;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].y, _658);
    float _668 = fma(_634, 0.12999999523162841796875, 1.0);
    float _670 = _616 * _662;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].x, _664);
    float _674 = _466 * _666;
    float _676 = _494 + _652;
    float _678 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _680 = _470 * _672;
    float _682 = fma(_650, 0.300000011920928955078125, _668);
    float _684 = -_630;
    float _686 = fma(_684, 0.5, 0.5);
    float _688 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].y, _678);
    float _692 = _492 + _640;
    float _694 = _682 * _686;
    float _696 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].y, _688);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _700 = _466 * _694;
    float _702 = _700 * 2.0;
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _706 = _676 + _698;
    float _708 = _692 + _704;
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _706);
    float _712 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _708);
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _718 = _710 + _716;
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].y, _712);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _724 = _714 + _722;
    float _726 = _718 * _718;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _730 = fma(_724, _724, _726);
    float _732 = _660 + _728;
    float _734 = sqrt(_730);
    float _736 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _732);
    bool _738 = _734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _740 = _720;
    float _742 = _712;
    float _744 = _726;
    float _746 = _638;
    float _748 = _460;
    if (!_738)
    {
        _740 = _714;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_738)
    {
        _742 = _710;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_738)
    {
        _744 = _736;
    }
    float _758 = _744;
    bool _760 = !_738;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _734 + _766;
        float _770 = rsqrt(_730);
        float _772 = _768 * _764;
        float _774 = _736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _790 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _792 = _770 * _788;
        float _794 = fma(_736, _780, _790);
        float _796 = fma(_724, _792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_718, _792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _794;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    float _806 = -_490;
    float _808 = _806 + _800;
    float _810 = -_492;
    float _812 = _810 + _802;
    float _814 = -_494;
    float _816 = _814 + _804;
    float _818 = _808 * _808;
    bool _820 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _828 = _824 || _826;
    float _830 = fma(_812, _812, _818);
    float _832 = fma(_816, _816, _830);
    float _834 = sqrt(_832);
    bool _836 = _834 > 0.0;
    bool _838 = !_836;
    float _840 = _802;
    float _842 = _800;
    float _844 = _804;
    float _846 = _812;
    if (!_838)
    {
        float _848 = _168 * _168;
        float _850 = fma(_166, _166, _848);
        float _852 = fma(_170, _170, _850);
        float _854 = rsqrt(_832);
        float _856 = sqrt(_852);
        float _858 = _812 * _854;
        float _860 = _808 * _854;
        float _862 = _816 * _854;
        bool _864 = _856 > 0.0;
        bool _866 = !_864;
        if (!_866)
        {
            float _868 = rsqrt(_852);
            float _870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _872 = _168 * _868;
            float _874 = _166 * _868;
            float _876 = _170 * _868;
            float _878 = _860 * _872;
            float _880 = fma(_858, _874, _878);
            float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _884 = fma(_862, _876, _880);
            float _886 = _884 * _882;
            float _888 = fma(_166, _886, _802);
            float _890 = fma(_168, _886, _800);
            float _892 = fma(_170, _886, _804);
            _840 = _888;
            _842 = _890;
            _844 = _892;
            _846 = _880;
        }
    }
    float _894 = _840;
    float _896 = _842;
    float _898 = _844;
    float _900 = _846;
    float _902 = _900;
    if (_828)
    {
        _174 = _894;
    }
    float _904 = _174;
    float _906 = _904;
    if (_828)
    {
        _176 = _896;
    }
    float _908 = _176;
    float _910 = _908;
    if (_828)
    {
        _178 = _898;
    }
    float _912 = _178;
    float _914 = _912;
    if (!_828)
    {
        float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _918 = _490 + _916;
        float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _922 = _492 + _920;
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _926 = -_492;
        float _928 = _926 + _894;
        float _930 = _918 * _918;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _934 = _494 + _932;
        float _936 = -_490;
        float _938 = _936 + _896;
        float _940 = -_494;
        float _942 = _940 + _898;
        float _944 = fma(_922, _922, _930);
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _948 = fma(_934, _934, _944);
        float _950 = sqrt(_948);
        float _952 = _924 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _954 = precise::min(_950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _956 = _954 * _946;
        float _958 = _952 * _956;
        float _960 = fma(_928, _958, _492);
        float _962 = fma(_938, _958, _490);
        float _964 = fma(_942, _958, _494);
        _910 = _962;
        _906 = _960;
        _914 = _964;
    }
    float _966 = _910;
    float _968 = _906;
    float _970 = _914;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _966 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = fma(_978, _978, _984);
    float _988 = fma(_982, _982, _986);
    float _990 = rsqrt(_988);
    float _992 = _990 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _994 = _978 * _992;
    float _996 = _982 * _992;
    float _998 = _994 * _994;
    float _1000 = _996 * _996;
    float _1002 = _998 + _1000;
    float _1004 = sqrt(_1002);
    bool _1006 = _1004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1010 = _1004 + _1008;
    float _1012 = _982;
    float _1014 = _1002;
    float _1016 = _1010;
    float _1018 = _992;
    bool _1020 = _1006;
    if (_1006)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1022;
    }
    float _1024 = _1012;
    if (_1006)
    {
        float _1026 = rsqrt(_1002);
        _1014 = _1026;
    }
    float _1028 = _1014;
    if (_1006)
    {
        float _1030 = _1010 * _1024;
        _1016 = _1030;
    }
    float _1032 = _1016;
    if (_1006)
    {
        float _1034 = _1032 * 0.15915493667125701904296875;
        _902 = _1034;
    }
    float _1036 = _902;
    float _1038 = _984;
    float _1040 = _1036;
    if (_1006)
    {
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        _1038 = _1044;
    }
    float _1046 = _1038;
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1050 = precise::max(0.0, _1048);
    float _1052 = _990;
    float _1054 = _1050;
    float _1056 = _1048;
    if (_1006)
    {
        float _1058 = _1036 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        _1052 = _1060;
    }
    float _1062 = _1052;
    float _1064 = -_992;
    float _1066 = -_1050;
    float _1068 = fma(_974, _1064, _1066);
    float _1070 = _1068;
    if (!_1006)
    {
        _1054 = _994;
    }
    float _1072 = _1054;
    float _1074 = _1072;
    if (_1006)
    {
        float _1076 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1056 = _1076;
    }
    float _1078 = _1056;
    float _1080 = _1046;
    float _1082 = _1078;
    if (_1006)
    {
        float _1084 = fma(_1046, _1078, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    float _1090 = _1062;
    if (_1006)
    {
        float _1092 = _1062 + (-1.0);
        _1082 = _1092;
    }
    float _1094 = _1082;
    float _1096 = _1094;
    if (_1006)
    {
        float _1098 = _1028 * _1086;
        _1018 = _1098;
    }
    float _1100 = _1018;
    if (!_1006)
    {
        _1088 = _998;
    }
    float _1102 = _1088;
    float _1104 = sqrt(_988);
    float _1106 = _1102;
    if (_1006)
    {
        float _1108 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1108;
    }
    float _1110 = _1040;
    if (_1006)
    {
        float _1112 = _994 * _1100;
        _1074 = _1112;
    }
    float _1114 = _1074;
    if (!_1006)
    {
        _1096 = _996;
    }
    float _1116 = _1096;
    float _1118 = _1116;
    if (_1006)
    {
        float _1120 = _996 * _1100;
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (_1006)
    {
        float _1124 = fma(_1068, _1062, _1110);
        _1070 = _1124;
    }
    float _1126 = _1070;
    if (_1006)
    {
        float _1128 = _1114 * _1114;
        _1106 = _1128;
    }
    float _1130 = _1106;
    if (!_1006)
    {
        _1090 = _1000;
    }
    float _1132 = _1090;
    float _1134 = _1132;
    if (_1006)
    {
        float _1136 = _1122 * _1122;
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = fma(_1126, _1126, _1130);
    float _1142 = _1140 + _1138;
    float _1144 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1146);
    float _1150 = precise::clamp(_1148, 0.0, 1.0);
    float _1152 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = rsqrt(_1142);
    float _1156 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1158 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1166 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1156);
    float _1168 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1170 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1174 = abs(_1162);
    float _1176 = log2(_1174);
    float _1178 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1182 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1180);
    float _1190 = _1154 * _1114;
    float _1192 = _1154 * _1126;
    float _1194 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1200 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = _1154 * _1122;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = -_1198;
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1214 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1216 = -_1202;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1164, 1.0);
    float _1224 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1228 = fma(_1218, -0.5, 0.5);
    float _1230 = exp2(_1212);
    float _1232 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = fma(_1218, 0.5, 0.5);
    float _1238 = _1192 + 1.0;
    float _1240 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1232);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1244 = fma(_1236, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1246 = log2(_1222);
    float _1248 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1240);
    float _1250 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = fma(_1236, _1244, -0.212114393711090087890625);
    float _1254 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1248);
    float _1256 = fma(_1236, _1252, 1.570728778839111328125);
    float _1258 = 1.0 / _1226;
    float _1260 = -_1192;
    float _1262 = fma(_1230, _1238, _1260);
    float _1264 = sqrt(_1228);
    float _1266 = _1246 * 0.693147182464599609375;
    float _1268 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1270 = _1254 * _1258;
    float _1272 = _1250 * _1258;
    float _1274 = fma(_1270, 0.5, 0.5);
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = _1264 * 0.636619746685028076171875;
    float3 _3938 = float3(_1274, _1276, _1268);
    float _1280 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3938, float3(0.0), isnan(_3938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3938, float3(0.0), isnan(_3938)), level(0.0)).x;
    float _1282 = -_1256;
    float _1284 = fma(_1278, _1282, 1.0);
    float _1286 = fma(_1262, 0.5, 0.5);
    float3 _3956 = float3(_1274, _1276, _1268);
    float4 _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3956, float3(0.0), isnan(_3956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3956, float3(0.0), isnan(_3956)), level(0.0)).xyzw;
    float _1291 = _1289.x;
    float _1293 = _1289.y;
    float _1295 = _1289.z;
    float _1297 = _1289.w;
    float2 _3973 = float2(_1284, _1286);
    float3 _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3973, float2(0.0), isnan(_3973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3973, float2(0.0), isnan(_3973)), level(0.0)).xyz;
    float _1303 = _1301.x;
    float _1305 = _1301.y;
    float _1307 = _1301.z;
    float _1309 = in.m_57.x;
    float _1311 = -_630;
    float _1313 = _1311 + 1.0;
    float _1315 = in.m_51.y;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _462 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1325 = _1323 != 0;
    float _1327 = in.m_51.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1339 = _1337 != 0;
    float _1341 = in.m_59.z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1345 = _1343 != 0;
    float _1347 = in.m_59.w;
    float _1349 = 1.0 / _1335;
    int _1351 = as_type<int>(_1268);
    if (_1319)
    {
        bool _1353 = _462 > 0.5;
        _1020 = _1353;
    }
    bool _1355 = _1020;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1361 = _460 > 0.5;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1367 = _1309;
    if (_1319)
    {
        float _1369 = -_1309;
        float _1371 = _1369 + 1.0;
        _1351 = as_type<int>(_1371);
    }
    int _1373 = _1351;
    if (!_1319)
    {
        _746 = _1309;
    }
    float _1375 = _746;
    float _1377 = 1.0 / _1359;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1383 = _1375;
    if (_1319)
    {
        float _1385 = _1355 ? as_type<float>(_1373) : _1309;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1391 = _1315 > 0.5;
    int _1393 = 0;
    if (_1331)
    {
        float _1395 = -_1309;
        float _1397 = _1395 + 1.0;
        _1393 = as_type<int>(_1397);
    }
    int _1399 = _1393;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1381;
    int _1407 = _1391 ? as_type<int>(_1313) : as_type<int>(_630);
    out.m_61.z = _1341;
    float _1409 = _1339 ? as_type<float>(_1407) : _630;
    out.m_61.w = _1347;
    bool _1411 = _1327 > 0.5;
    float _1413 = 1.0 / _1365;
    int _1415 = _1361 ? as_type<int>(_1313) : as_type<int>(_630);
    int _1417 = _1411 ? as_type<int>(_1313) : as_type<int>(_630);
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1429 = _1425 || _1427;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1435 = -_1419;
    float _1437 = fma(_1321, 2.0, _1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1441 = _1345 ? as_type<float>(_1415) : _630;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = fma(_1389, -2.0, _1431);
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1455 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1455;
    out.m_63.y = _1459;
    out.m_63.z = _1461;
    out.m_63.w = _1457;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1481 = _1465 * _1349;
    float _1483 = _1469 * _1377;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1487 = _450 + _1485;
    float _1489 = _1473 * _1405;
    float _1491 = _1477 * _1413;
    float _1493 = _1403 ? as_type<float>(_1417) : _630;
    float _1495 = fma(_1481, _1487, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1499 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1501 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1503 = isnan(_450);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_126;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1519 = _450 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1523 = _450 + _1521;
    float _1525 = fma(_1497, _1409, -0.5);
    float _1527 = fma(_1493, _1499, -0.5);
    float _1529 = fma(_1483, _1519, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1531 = fma(_1489, _1523, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1533 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1535 = isnan(_450);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = _1499;
    if (!_1447)
    {
        _1549 = _1315;
    }
    float _1551 = _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1557 = isnan(_450);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1569 = -_1543;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1575 = _450 + _1573;
    float _1577 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1579 = _1543 * _1547;
    float _1581 = _1553;
    float _1583 = _1551;
    float _1585 = _1571;
    float _1587 = _1579;
    if (!_1447)
    {
        _1581 = _1551;
    }
    float _1589 = _1581;
    float _1591 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1593 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1567);
    float _1595 = _1589;
    if (_1447)
    {
        _1583 = _1315;
    }
    float _1597 = _1583;
    float _1599 = _1565 * _1571;
    bool _1601 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1603 = isnan(_450);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1491, _1575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1615 = -_1565;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1441, _1591, -0.5);
    bool _1621 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1623 = isnan(_450);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1577);
    float _1635 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1451);
    float _1637 = _1611 * _1617;
    float _1639 = -_1611;
    float _1641 = _1639 + 1.0;
    int _1643 = as_type<int>(_1633);
    float _1645 = _1597;
    if (_1447)
    {
        _1585 = _462;
    }
    float _1647 = _1585;
    float _1649 = -_1635;
    float _1651 = fma(_1633, _1525, _1649);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1655 = _1647;
    if (!_1447)
    {
        _1655 = _460;
    }
    float _1657 = _1655;
    float _1659 = _1631 * _1641;
    float _1661 = -_1631;
    float _1663 = _1661 + 1.0;
    if (_1447)
    {
        _1595 = _462;
    }
    float _1665 = _1595;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1669 = _1495 * _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1667;
    float _1675 = _1669;
    if (_1325)
    {
        float _1677 = -_1309;
        float _1679 = _1677 + 1.0;
        _1643 = as_type<int>(_1679);
    }
    int _1681 = _1643;
    float _1683 = -_1653;
    float _1685 = fma(_1667, 2.0, _1683);
    float _1687 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1689 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1669);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1325)
    {
        _1673 = _1309;
    }
    float _1693 = _1673;
    float _1695 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1697 = _1693;
    if (!_1447)
    {
        _1675 = _460;
    }
    float _1699 = _1675;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1703 = _1699;
    if (_1325)
    {
        float _1705 = _1361 ? as_type<float>(_1681) : _1309;
        _1697 = _1705;
    }
    float _1707 = _1697;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1447)
    {
        _748 = _1597;
    }
    float _1711 = _748;
    float _1713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1331)
    {
        float _1715 = _1391 ? as_type<float>(_1399) : _1309;
        _1367 = _1715;
    }
    float _1717 = _1367;
    float _1719 = -_1701;
    float _1721 = fma(_1695, 2.0, _1719);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1709);
    float _1725 = _490 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1447)
    {
        _1703 = _1597;
    }
    float _1727 = _1703;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1725);
    if (!_1447)
    {
        _1645 = _462;
    }
    float _1737 = _1645;
    float _1739 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1731);
    float _1741 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _490 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1745 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1749 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1743);
    float _1751 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1613, _1637, _1689);
    float _1757 = fma(_1747, _1387, -0.5);
    float _1759 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = 1.0 / _1753;
    float _1765 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1767 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1749);
    float _1769 = fma(_1751, _1707, -0.5);
    float _1771 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1687);
    float _1773 = -_126;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1721);
    float _1777 = fma(_1765, -2.0, _1761);
    float _1779 = fma(_1529, _1599, _1755);
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1739);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1759, _1717, -0.5);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = -_126;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1685);
    float _1793 = fma(_1771, _1769, _1775);
    float _1795 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1723);
    float _1797 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1799 = fma(_1781, _1757, _1515);
    float _1801 = _1783 + _1753;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1805 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1807 = fma(_1787, _1785, _1791);
    float _1809 = _1785;
    if (!_1429)
    {
        _1809 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1811 = _1809;
    float _1813 = -_1797;
    float _1815 = fma(_1795, _1527, _1813);
    float _1817 = _1801 * _1763;
    float _1819 = _1817 * 0.5;
    float _1821 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = fma(_1805, -2.0, _1803);
    float _1825 = fma(_1531, _1579, _1779);
    float _1827 = _1819;
    if (!_1429)
    {
        float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1831 = fma(_1819, _1811, _1829);
        _1827 = _1831;
    }
    float _1833 = _1827;
    float _1835 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1593);
    float _1837 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1839 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1823);
    float _1841 = _1839;
    if (!_1429)
    {
        _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1843 = _1587;
    float _1845 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1847 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = -_1839;
    float _1851 = fma(_1835, _1619, _1849);
    float _1853 = _1833;
    if (!_1429)
    {
        float _1855 = 1.0 / _1833;
        _1853 = _1855;
    }
    float _1857 = _1853;
    if (!_1429)
    {
        float _1859 = -_1843;
        float _1861 = _1859 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1841 = _1861;
    }
    float _1863 = _1841;
    float _1865 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1825);
    float _1867 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = exp2(_1847);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1429)
    {
        _420 = 1.0;
    }
    float _1881 = _420;
    float _1883 = _1793 + 0.5;
    float _1885 = _1651 + 0.5;
    float _1887 = _1799 + 0.5;
    out.m_65.x = _1871;
    out.m_65.y = _1875;
    out.m_65.z = _1879;
    out.m_65.w = _1873;
    float _1889 = _1815 + 0.5;
    float _1891 = _1803;
    float _1893 = _1881;
    if (!_1429)
    {
        float _1895 = 1.0 / _1863;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1429)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1843;
        float _1903 = fma(_1857, _1899, _1901);
        _422 = _1903;
    }
    float _1905 = _422;
    float _1907 = _1226 * 0.5;
    out.m_67.x = _1887;
    out.m_67.y = _1885;
    out.m_67.z = _1883;
    out.m_67.w = _1889;
    float _1909 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1911 = _1254 + _1226;
    float _1913 = _1851 + 0.5;
    float _1915 = -_1877;
    float _1917 = _1915 + 1.0;
    float _1919 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1909);
    float _1921 = _1911 * 0.5;
    float _1923 = fma(_1250, -0.5, _1907);
    if (!_1429)
    {
        float _1925 = _1905 * _1897;
        float _1927 = precise::clamp(_1925, 0.0, 1.0);
        _1893 = _1927;
    }
    float _1929 = _1893;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = _1807 + 0.5;
    float _1935 = _1919 + _1226;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1939 = _1929 > 0.0;
    bool _1941 = isnan(_1929);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(0.0);
    bool _1947 = _1943 || _1945;
    float _1949 = -_1931;
    float _1951 = _1949 + 1.0;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1226;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1955 = _1935 * 0.5;
    out.m_69.x = _1933;
    out.m_69.y = _1913;
    out.m_71.x = _1921;
    out.m_71.y = _1923;
    out.m_71.z = _1955;
    out.m_71.w = _1226;
    out.m_45.x = _1953;
    float _1957 = _1931 * _1280;
    float _1959 = _1297 * _1957;
    float _1961 = _1297 * _1951;
    float _1963 = _1307 * _1957;
    float _1965 = fma(_1303, _1959, _1291);
    float _1967 = fma(_1305, _1959, _1293);
    float _1969 = fma(_1297, _1963, _1295);
    out.m_73.x = _1965;
    out.m_73.y = _1967;
    out.m_73.z = _1969;
    out.m_73.w = _1961;
    if (_1947)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1971;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _442 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_108);
        out.gl_Position.z = _2028;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_144);
        out.gl_Position.z = _2096;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _174 = _168;
    float _176 = _170;
    float _178 = _166;
    float _196;
    if (!_172)
    {
        float _180 = in.m_51.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _126 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _264 * _252;
    float _276 = _272 * _252;
    float _278 = _270 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_53.x;
    float _324 = in.m_53.y;
    float _326 = in.m_53.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _286 * _322;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = _376 * _358;
    float _390 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = -_376;
    float _396 = _394 + 1.0;
    float _398 = _386 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = _290 * _326;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _420 = _414;
    float _422 = _416;
    float _440;
    if (!_418)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_92);
        float _446 = 1.0 / _444;
        float _448 = _126 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    float _458 = 1.0 / _354;
    float _460 = in.m_51.z;
    float _462 = in.m_51.x;
    float _464 = 1.0 / _352;
    float _466 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = 1.0 / _404;
    float _470 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _472 = _454 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _476 = _454 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _478 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].x, _474);
    float _482 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].x, _476);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _494 = _488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -_490;
    float _498 = _496 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = -_492;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = -_494;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _508 = _498 * _498;
    float _510 = fma(_502, _502, _508);
    float _512 = fma(_506, _506, _510);
    float _514 = rsqrt(_512);
    float _516 = _502 * _514;
    float _518 = _506 * _514;
    float _520 = _498 * _514;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _524 = _516 * _522;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _518 * _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _532 = _520 * _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _536 = -_524;
    float _538 = fma(_518, _534, _536);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _542 = -_528;
    float _544 = fma(_520, _540, _542);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _554 = -_532;
    float _556 = fma(_516, _552, _554);
    float _558 = _538 * _538;
    float _560 = fma(_544, _544, _558);
    float _562 = fma(_556, _556, _560);
    float _564 = rsqrt(_562);
    float _566 = _458 * _548;
    float _568 = _464 * _546;
    float _570 = _468 * _550;
    float _572 = _460 * 6.283185482025146484375;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _578 = _538 * _564;
    float _580 = _544 * _564;
    float _582 = _556 * _564;
    float _584 = _574 * _466;
    float _586 = _518 * _578;
    float _588 = _520 * _580;
    float _590 = _516 * _582;
    float _592 = fma(_126, 0.310000002384185791015625, _572);
    float _594 = -_586;
    float _596 = fma(_520, _582, _594);
    float _598 = -_588;
    float _600 = fma(_516, _578, _598);
    float _602 = -_590;
    float _604 = fma(_518, _580, _602);
    float _606 = _584 * _596;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _610 = _584 * _600;
    float _612 = _584 * _604;
    float _614 = _462 * 6.283185482025146484375;
    float _616 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _608 * _470;
    float _620 = _592 * 0.15915493667125701904296875;
    float _622 = fma(_126, 0.10999999940395355224609375, _614);
    float _624 = _576 * _616;
    float _626 = fma(_618, _578, _612);
    float _628 = fma(_618, _580, _606);
    float _630 = in.m_57.y;
    float _632 = _620 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = fma(_624, _520, _626);
    float _638 = _622 * 0.15915493667125701904296875;
    float _640 = fma(_624, _516, _628);
    float _642 = fma(_618, _582, _610);
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _646 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _648 = _638 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(_624, _518, _642);
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _656 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].y, _646);
    float _660 = _490 + _636;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].y, _658);
    float _668 = fma(_634, 0.12999999523162841796875, 1.0);
    float _670 = _616 * _662;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].x, _664);
    float _674 = _466 * _666;
    float _676 = _494 + _652;
    float _678 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _680 = _470 * _672;
    float _682 = fma(_650, 0.300000011920928955078125, _668);
    float _684 = -_630;
    float _686 = fma(_684, 0.5, 0.5);
    float _688 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].y, _678);
    float _692 = _492 + _640;
    float _694 = _682 * _686;
    float _696 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].y, _688);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _700 = _466 * _694;
    float _702 = _700 * 2.0;
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _706 = _676 + _698;
    float _708 = _692 + _704;
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _706);
    float _712 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _708);
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _718 = _710 + _716;
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].y, _712);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _724 = _714 + _722;
    float _726 = _718 * _718;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _730 = fma(_724, _724, _726);
    float _732 = _660 + _728;
    float _734 = sqrt(_730);
    float _736 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _732);
    bool _738 = _734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _740 = _720;
    float _742 = _712;
    float _744 = _726;
    float _746 = _638;
    float _748 = _460;
    if (!_738)
    {
        _740 = _714;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_738)
    {
        _742 = _710;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_738)
    {
        _744 = _736;
    }
    float _758 = _744;
    bool _760 = !_738;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _734 + _766;
        float _770 = rsqrt(_730);
        float _772 = _768 * _764;
        float _774 = _736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _790 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _792 = _770 * _788;
        float _794 = fma(_736, _780, _790);
        float _796 = fma(_724, _792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_718, _792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _794;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    float _806 = -_490;
    float _808 = _806 + _800;
    float _810 = -_492;
    float _812 = _810 + _802;
    float _814 = -_494;
    float _816 = _814 + _804;
    float _818 = _808 * _808;
    bool _820 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _828 = _824 || _826;
    float _830 = fma(_812, _812, _818);
    float _832 = fma(_816, _816, _830);
    float _834 = sqrt(_832);
    bool _836 = _834 > 0.0;
    bool _838 = !_836;
    float _840 = _802;
    float _842 = _800;
    float _844 = _804;
    float _846 = _812;
    if (!_838)
    {
        float _848 = _168 * _168;
        float _850 = fma(_166, _166, _848);
        float _852 = fma(_170, _170, _850);
        float _854 = rsqrt(_832);
        float _856 = sqrt(_852);
        float _858 = _812 * _854;
        float _860 = _808 * _854;
        float _862 = _816 * _854;
        bool _864 = _856 > 0.0;
        bool _866 = !_864;
        if (!_866)
        {
            float _868 = rsqrt(_852);
            float _870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _872 = _168 * _868;
            float _874 = _166 * _868;
            float _876 = _170 * _868;
            float _878 = _860 * _872;
            float _880 = fma(_858, _874, _878);
            float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _884 = fma(_862, _876, _880);
            float _886 = _884 * _882;
            float _888 = fma(_166, _886, _802);
            float _890 = fma(_168, _886, _800);
            float _892 = fma(_170, _886, _804);
            _840 = _888;
            _842 = _890;
            _844 = _892;
            _846 = _880;
        }
    }
    float _894 = _840;
    float _896 = _842;
    float _898 = _844;
    float _900 = _846;
    float _902 = _900;
    if (_828)
    {
        _174 = _894;
    }
    float _904 = _174;
    float _906 = _904;
    if (_828)
    {
        _176 = _896;
    }
    float _908 = _176;
    float _910 = _908;
    if (_828)
    {
        _178 = _898;
    }
    float _912 = _178;
    float _914 = _912;
    if (!_828)
    {
        float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _918 = _490 + _916;
        float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _922 = _492 + _920;
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _926 = -_492;
        float _928 = _926 + _894;
        float _930 = _918 * _918;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _934 = _494 + _932;
        float _936 = -_490;
        float _938 = _936 + _896;
        float _940 = -_494;
        float _942 = _940 + _898;
        float _944 = fma(_922, _922, _930);
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _948 = fma(_934, _934, _944);
        float _950 = sqrt(_948);
        float _952 = _924 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _954 = precise::min(_950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _956 = _954 * _946;
        float _958 = _952 * _956;
        float _960 = fma(_928, _958, _492);
        float _962 = fma(_938, _958, _490);
        float _964 = fma(_942, _958, _494);
        _910 = _962;
        _906 = _960;
        _914 = _964;
    }
    float _966 = _910;
    float _968 = _906;
    float _970 = _914;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _966 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = fma(_978, _978, _984);
    float _988 = fma(_982, _982, _986);
    float _990 = rsqrt(_988);
    float _992 = _990 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _994 = _978 * _992;
    float _996 = _982 * _992;
    float _998 = _994 * _994;
    float _1000 = _996 * _996;
    float _1002 = _998 + _1000;
    float _1004 = sqrt(_1002);
    bool _1006 = _1004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1010 = _1004 + _1008;
    float _1012 = _982;
    float _1014 = _1002;
    float _1016 = _1010;
    float _1018 = _992;
    bool _1020 = _1006;
    if (_1006)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1022;
    }
    float _1024 = _1012;
    if (_1006)
    {
        float _1026 = rsqrt(_1002);
        _1014 = _1026;
    }
    float _1028 = _1014;
    if (_1006)
    {
        float _1030 = _1010 * _1024;
        _1016 = _1030;
    }
    float _1032 = _1016;
    if (_1006)
    {
        float _1034 = _1032 * 0.15915493667125701904296875;
        _902 = _1034;
    }
    float _1036 = _902;
    float _1038 = _984;
    float _1040 = _1036;
    if (_1006)
    {
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        _1038 = _1044;
    }
    float _1046 = _1038;
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1050 = precise::max(0.0, _1048);
    float _1052 = _990;
    float _1054 = _1050;
    float _1056 = _1048;
    if (_1006)
    {
        float _1058 = _1036 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        _1052 = _1060;
    }
    float _1062 = _1052;
    float _1064 = -_992;
    float _1066 = -_1050;
    float _1068 = fma(_974, _1064, _1066);
    float _1070 = _1068;
    if (!_1006)
    {
        _1054 = _994;
    }
    float _1072 = _1054;
    float _1074 = _1072;
    if (_1006)
    {
        float _1076 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1056 = _1076;
    }
    float _1078 = _1056;
    float _1080 = _1046;
    float _1082 = _1078;
    if (_1006)
    {
        float _1084 = fma(_1046, _1078, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    float _1090 = _1062;
    if (_1006)
    {
        float _1092 = _1062 + (-1.0);
        _1082 = _1092;
    }
    float _1094 = _1082;
    float _1096 = _1094;
    if (_1006)
    {
        float _1098 = _1028 * _1086;
        _1018 = _1098;
    }
    float _1100 = _1018;
    if (!_1006)
    {
        _1088 = _998;
    }
    float _1102 = _1088;
    float _1104 = sqrt(_988);
    float _1106 = _1102;
    if (_1006)
    {
        float _1108 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1108;
    }
    float _1110 = _1040;
    if (_1006)
    {
        float _1112 = _994 * _1100;
        _1074 = _1112;
    }
    float _1114 = _1074;
    if (!_1006)
    {
        _1096 = _996;
    }
    float _1116 = _1096;
    float _1118 = _1116;
    if (_1006)
    {
        float _1120 = _996 * _1100;
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (_1006)
    {
        float _1124 = fma(_1068, _1062, _1110);
        _1070 = _1124;
    }
    float _1126 = _1070;
    if (_1006)
    {
        float _1128 = _1114 * _1114;
        _1106 = _1128;
    }
    float _1130 = _1106;
    if (!_1006)
    {
        _1090 = _1000;
    }
    float _1132 = _1090;
    float _1134 = _1132;
    if (_1006)
    {
        float _1136 = _1122 * _1122;
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = fma(_1126, _1126, _1130);
    float _1142 = _1140 + _1138;
    float _1144 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1146);
    float _1150 = precise::clamp(_1148, 0.0, 1.0);
    float _1152 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = rsqrt(_1142);
    float _1156 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1158 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1166 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1156);
    float _1168 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1170 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1174 = abs(_1162);
    float _1176 = log2(_1174);
    float _1178 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1182 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1180);
    float _1190 = _1154 * _1114;
    float _1192 = _1154 * _1126;
    float _1194 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1200 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = _1154 * _1122;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = -_1198;
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1214 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1216 = -_1202;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1164, 1.0);
    float _1224 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1228 = fma(_1218, -0.5, 0.5);
    float _1230 = exp2(_1212);
    float _1232 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = fma(_1218, 0.5, 0.5);
    float _1238 = _1192 + 1.0;
    float _1240 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1232);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1244 = fma(_1236, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1246 = log2(_1222);
    float _1248 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1240);
    float _1250 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = fma(_1236, _1244, -0.212114393711090087890625);
    float _1254 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1248);
    float _1256 = fma(_1236, _1252, 1.570728778839111328125);
    float _1258 = 1.0 / _1226;
    float _1260 = -_1192;
    float _1262 = fma(_1230, _1238, _1260);
    float _1264 = sqrt(_1228);
    float _1266 = _1246 * 0.693147182464599609375;
    float _1268 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1270 = _1254 * _1258;
    float _1272 = _1250 * _1258;
    float _1274 = fma(_1270, 0.5, 0.5);
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = _1264 * 0.636619746685028076171875;
    float3 _3938 = float3(_1274, _1276, _1268);
    float _1280 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3938, float3(0.0), isnan(_3938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3938, float3(0.0), isnan(_3938)), level(0.0)).x;
    float _1282 = -_1256;
    float _1284 = fma(_1278, _1282, 1.0);
    float _1286 = fma(_1262, 0.5, 0.5);
    float3 _3956 = float3(_1274, _1276, _1268);
    float4 _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3956, float3(0.0), isnan(_3956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3956, float3(0.0), isnan(_3956)), level(0.0)).xyzw;
    float _1291 = _1289.x;
    float _1293 = _1289.y;
    float _1295 = _1289.z;
    float _1297 = _1289.w;
    float2 _3973 = float2(_1284, _1286);
    float3 _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3973, float2(0.0), isnan(_3973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3973, float2(0.0), isnan(_3973)), level(0.0)).xyz;
    float _1303 = _1301.x;
    float _1305 = _1301.y;
    float _1307 = _1301.z;
    float _1309 = in.m_57.x;
    float _1311 = -_630;
    float _1313 = _1311 + 1.0;
    float _1315 = in.m_51.y;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _462 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1325 = _1323 != 0;
    float _1327 = in.m_51.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1339 = _1337 != 0;
    float _1341 = in.m_59.z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1345 = _1343 != 0;
    float _1347 = in.m_59.w;
    float _1349 = 1.0 / _1335;
    int _1351 = as_type<int>(_1268);
    if (_1319)
    {
        bool _1353 = _462 > 0.5;
        _1020 = _1353;
    }
    bool _1355 = _1020;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1361 = _460 > 0.5;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1367 = _1309;
    if (_1319)
    {
        float _1369 = -_1309;
        float _1371 = _1369 + 1.0;
        _1351 = as_type<int>(_1371);
    }
    int _1373 = _1351;
    if (!_1319)
    {
        _746 = _1309;
    }
    float _1375 = _746;
    float _1377 = 1.0 / _1359;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1383 = _1375;
    if (_1319)
    {
        float _1385 = _1355 ? as_type<float>(_1373) : _1309;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1391 = _1315 > 0.5;
    int _1393 = 0;
    if (_1331)
    {
        float _1395 = -_1309;
        float _1397 = _1395 + 1.0;
        _1393 = as_type<int>(_1397);
    }
    int _1399 = _1393;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1381;
    int _1407 = _1391 ? as_type<int>(_1313) : as_type<int>(_630);
    out.m_61.z = _1341;
    float _1409 = _1339 ? as_type<float>(_1407) : _630;
    out.m_61.w = _1347;
    bool _1411 = _1327 > 0.5;
    float _1413 = 1.0 / _1365;
    int _1415 = _1361 ? as_type<int>(_1313) : as_type<int>(_630);
    int _1417 = _1411 ? as_type<int>(_1313) : as_type<int>(_630);
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1429 = _1425 || _1427;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1435 = -_1419;
    float _1437 = fma(_1321, 2.0, _1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1441 = _1345 ? as_type<float>(_1415) : _630;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = fma(_1389, -2.0, _1431);
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1455 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1455;
    out.m_63.y = _1459;
    out.m_63.z = _1461;
    out.m_63.w = _1457;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1481 = _1465 * _1349;
    float _1483 = _1469 * _1377;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1487 = _450 + _1485;
    float _1489 = _1473 * _1405;
    float _1491 = _1477 * _1413;
    float _1493 = _1403 ? as_type<float>(_1417) : _630;
    float _1495 = fma(_1481, _1487, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1499 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1501 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1503 = isnan(_450);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_126;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1519 = _450 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1523 = _450 + _1521;
    float _1525 = fma(_1497, _1409, -0.5);
    float _1527 = fma(_1493, _1499, -0.5);
    float _1529 = fma(_1483, _1519, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1531 = fma(_1489, _1523, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1533 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1535 = isnan(_450);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = _1499;
    if (!_1447)
    {
        _1549 = _1315;
    }
    float _1551 = _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1557 = isnan(_450);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1569 = -_1543;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1575 = _450 + _1573;
    float _1577 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1579 = _1543 * _1547;
    float _1581 = _1553;
    float _1583 = _1551;
    float _1585 = _1571;
    float _1587 = _1579;
    if (!_1447)
    {
        _1581 = _1551;
    }
    float _1589 = _1581;
    float _1591 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1593 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1567);
    float _1595 = _1589;
    if (_1447)
    {
        _1583 = _1315;
    }
    float _1597 = _1583;
    float _1599 = _1565 * _1571;
    bool _1601 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1603 = isnan(_450);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1491, _1575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1615 = -_1565;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1441, _1591, -0.5);
    bool _1621 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1623 = isnan(_450);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1577);
    float _1635 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1451);
    float _1637 = _1611 * _1617;
    float _1639 = -_1611;
    float _1641 = _1639 + 1.0;
    int _1643 = as_type<int>(_1633);
    float _1645 = _1597;
    if (_1447)
    {
        _1585 = _462;
    }
    float _1647 = _1585;
    float _1649 = -_1635;
    float _1651 = fma(_1633, _1525, _1649);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1655 = _1647;
    if (!_1447)
    {
        _1655 = _460;
    }
    float _1657 = _1655;
    float _1659 = _1631 * _1641;
    float _1661 = -_1631;
    float _1663 = _1661 + 1.0;
    if (_1447)
    {
        _1595 = _462;
    }
    float _1665 = _1595;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1669 = _1495 * _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1667;
    float _1675 = _1669;
    if (_1325)
    {
        float _1677 = -_1309;
        float _1679 = _1677 + 1.0;
        _1643 = as_type<int>(_1679);
    }
    int _1681 = _1643;
    float _1683 = -_1653;
    float _1685 = fma(_1667, 2.0, _1683);
    float _1687 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1689 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1669);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1325)
    {
        _1673 = _1309;
    }
    float _1693 = _1673;
    float _1695 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1697 = _1693;
    if (!_1447)
    {
        _1675 = _460;
    }
    float _1699 = _1675;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1703 = _1699;
    if (_1325)
    {
        float _1705 = _1361 ? as_type<float>(_1681) : _1309;
        _1697 = _1705;
    }
    float _1707 = _1697;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1447)
    {
        _748 = _1597;
    }
    float _1711 = _748;
    float _1713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1331)
    {
        float _1715 = _1391 ? as_type<float>(_1399) : _1309;
        _1367 = _1715;
    }
    float _1717 = _1367;
    float _1719 = -_1701;
    float _1721 = fma(_1695, 2.0, _1719);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1709);
    float _1725 = _490 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1447)
    {
        _1703 = _1597;
    }
    float _1727 = _1703;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1725);
    if (!_1447)
    {
        _1645 = _462;
    }
    float _1737 = _1645;
    float _1739 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1731);
    float _1741 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _490 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1745 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1749 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1743);
    float _1751 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1613, _1637, _1689);
    float _1757 = fma(_1747, _1387, -0.5);
    float _1759 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = 1.0 / _1753;
    float _1765 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1767 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1749);
    float _1769 = fma(_1751, _1707, -0.5);
    float _1771 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1687);
    float _1773 = -_126;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1721);
    float _1777 = fma(_1765, -2.0, _1761);
    float _1779 = fma(_1529, _1599, _1755);
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1739);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1759, _1717, -0.5);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = -_126;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1685);
    float _1793 = fma(_1771, _1769, _1775);
    float _1795 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1723);
    float _1797 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1799 = fma(_1781, _1757, _1515);
    float _1801 = _1783 + _1753;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1805 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1807 = fma(_1787, _1785, _1791);
    float _1809 = _1785;
    if (!_1429)
    {
        _1809 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1811 = _1809;
    float _1813 = -_1797;
    float _1815 = fma(_1795, _1527, _1813);
    float _1817 = _1801 * _1763;
    float _1819 = _1817 * 0.5;
    float _1821 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = fma(_1805, -2.0, _1803);
    float _1825 = fma(_1531, _1579, _1779);
    float _1827 = _1819;
    if (!_1429)
    {
        float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1831 = fma(_1819, _1811, _1829);
        _1827 = _1831;
    }
    float _1833 = _1827;
    float _1835 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1593);
    float _1837 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1839 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1823);
    float _1841 = _1839;
    if (!_1429)
    {
        _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1843 = _1587;
    float _1845 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1847 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = -_1839;
    float _1851 = fma(_1835, _1619, _1849);
    float _1853 = _1833;
    if (!_1429)
    {
        float _1855 = 1.0 / _1833;
        _1853 = _1855;
    }
    float _1857 = _1853;
    if (!_1429)
    {
        float _1859 = -_1843;
        float _1861 = _1859 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1841 = _1861;
    }
    float _1863 = _1841;
    float _1865 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1825);
    float _1867 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = exp2(_1847);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1429)
    {
        _420 = 1.0;
    }
    float _1881 = _420;
    float _1883 = _1793 + 0.5;
    float _1885 = _1651 + 0.5;
    float _1887 = _1799 + 0.5;
    out.m_65.x = _1871;
    out.m_65.y = _1875;
    out.m_65.z = _1879;
    out.m_65.w = _1873;
    float _1889 = _1815 + 0.5;
    float _1891 = _1803;
    float _1893 = _1881;
    if (!_1429)
    {
        float _1895 = 1.0 / _1863;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1429)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1843;
        float _1903 = fma(_1857, _1899, _1901);
        _422 = _1903;
    }
    float _1905 = _422;
    float _1907 = _1226 * 0.5;
    out.m_67.x = _1887;
    out.m_67.y = _1885;
    out.m_67.z = _1883;
    out.m_67.w = _1889;
    float _1909 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1911 = _1254 + _1226;
    float _1913 = _1851 + 0.5;
    float _1915 = -_1877;
    float _1917 = _1915 + 1.0;
    float _1919 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1909);
    float _1921 = _1911 * 0.5;
    float _1923 = fma(_1250, -0.5, _1907);
    if (!_1429)
    {
        float _1925 = _1905 * _1897;
        float _1927 = precise::clamp(_1925, 0.0, 1.0);
        _1893 = _1927;
    }
    float _1929 = _1893;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = _1807 + 0.5;
    float _1935 = _1919 + _1226;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1939 = _1929 > 0.0;
    bool _1941 = isnan(_1929);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(0.0);
    bool _1947 = _1943 || _1945;
    float _1949 = -_1931;
    float _1951 = _1949 + 1.0;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1226;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1955 = _1935 * 0.5;
    out.m_69.x = _1933;
    out.m_69.y = _1913;
    out.m_71.x = _1921;
    out.m_71.y = _1923;
    out.m_71.z = _1955;
    out.m_71.w = _1226;
    out.m_45.x = _1953;
    float _1957 = _1931 * _1280;
    float _1959 = _1297 * _1957;
    float _1961 = _1297 * _1951;
    float _1963 = _1307 * _1957;
    float _1965 = fma(_1303, _1959, _1291);
    float _1967 = fma(_1305, _1959, _1293);
    float _1969 = fma(_1297, _1963, _1295);
    out.m_73.x = _1965;
    out.m_73.y = _1967;
    out.m_73.z = _1969;
    out.m_73.w = _1961;
    if (_1947)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1971;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _442 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_108);
        out.gl_Position.z = _2028;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2096 = as_type<float>(_144);
        out.gl_Position.z = _2096;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _174 = _168;
    float _176 = _170;
    float _178 = _166;
    float _196;
    if (!_172)
    {
        float _180 = in.m_51.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _126 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = _264 * _252;
    float _276 = _272 * _252;
    float _278 = _270 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _274);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_51.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _126 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_53.x;
    float _324 = in.m_53.y;
    float _326 = in.m_53.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _286 * _322;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _388 = _376 * _358;
    float _390 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _392 = fma(_384, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _394 = -_376;
    float _396 = _394 + 1.0;
    float _398 = _386 * _388;
    float _400 = _390 * _388;
    float _402 = _392 * _388;
    float _404 = _290 * _326;
    float _406 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _408 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _410 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _420 = _414;
    float _422 = _416;
    float _440;
    if (!_418)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        float _444 = float(_92);
        float _446 = 1.0 / _444;
        float _448 = _126 * _446;
        _440 = _448;
    }
    _442 = false;
    float _450 = _440;
    float _452 = in.m_42.x;
    float _454 = in.m_42.y;
    float _456 = in.m_42.z;
    float _458 = 1.0 / _354;
    float _460 = in.m_51.z;
    float _462 = in.m_51.x;
    float _464 = 1.0 / _352;
    float _466 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = 1.0 / _404;
    float _470 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _472 = _454 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = _454 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _476 = _454 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _478 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _480 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[4].x, _474);
    float _482 = fma(_452, (*spvDescriptorSet0.vp_c10)._m0[6].x, _476);
    float _484 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[5].z, _478);
    float _486 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[4].z, _480);
    float _488 = fma(_456, (*spvDescriptorSet0.vp_c10)._m0[6].z, _482);
    float _490 = _484 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _492 = _486 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _494 = _488 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -_490;
    float _498 = _496 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _500 = -_492;
    float _502 = _500 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = -_494;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _508 = _498 * _498;
    float _510 = fma(_502, _502, _508);
    float _512 = fma(_506, _506, _510);
    float _514 = rsqrt(_512);
    float _516 = _502 * _514;
    float _518 = _506 * _514;
    float _520 = _498 * _514;
    float _522 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _524 = _516 * _522;
    float _526 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _528 = _518 * _526;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _532 = _520 * _530;
    float _534 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _536 = -_524;
    float _538 = fma(_518, _534, _536);
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _542 = -_528;
    float _544 = fma(_520, _540, _542);
    float _546 = in.m_55.x;
    float _548 = in.m_55.y;
    float _550 = in.m_55.z;
    float _552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _554 = -_532;
    float _556 = fma(_516, _552, _554);
    float _558 = _538 * _538;
    float _560 = fma(_544, _544, _558);
    float _562 = fma(_556, _556, _560);
    float _564 = rsqrt(_562);
    float _566 = _458 * _548;
    float _568 = _464 * _546;
    float _570 = _468 * _550;
    float _572 = _460 * 6.283185482025146484375;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _566);
    float _576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _570);
    float _578 = _538 * _564;
    float _580 = _544 * _564;
    float _582 = _556 * _564;
    float _584 = _574 * _466;
    float _586 = _518 * _578;
    float _588 = _520 * _580;
    float _590 = _516 * _582;
    float _592 = fma(_126, 0.310000002384185791015625, _572);
    float _594 = -_586;
    float _596 = fma(_520, _582, _594);
    float _598 = -_588;
    float _600 = fma(_516, _578, _598);
    float _602 = -_590;
    float _604 = fma(_518, _580, _602);
    float _606 = _584 * _596;
    float _608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _610 = _584 * _600;
    float _612 = _584 * _604;
    float _614 = _462 * 6.283185482025146484375;
    float _616 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _618 = _608 * _470;
    float _620 = _592 * 0.15915493667125701904296875;
    float _622 = fma(_126, 0.10999999940395355224609375, _614);
    float _624 = _576 * _616;
    float _626 = fma(_618, _578, _612);
    float _628 = fma(_618, _580, _606);
    float _630 = in.m_57.y;
    float _632 = _620 * 6.283185482025146484375;
    float _634 = sin(_632);
    float _636 = fma(_624, _520, _626);
    float _638 = _622 * 0.15915493667125701904296875;
    float _640 = fma(_624, _516, _628);
    float _642 = fma(_618, _582, _610);
    float _644 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _646 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _648 = _638 * 6.283185482025146484375;
    float _650 = sin(_648);
    float _652 = fma(_624, _518, _642);
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _656 = _636 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _658 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].y, _646);
    float _660 = _490 + _636;
    float _662 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].z, _654);
    float _664 = fma(_640, (*spvDescriptorSet0.vp_c10)._m0[8].x, _656);
    float _666 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].y, _658);
    float _668 = fma(_634, 0.12999999523162841796875, 1.0);
    float _670 = _616 * _662;
    float _672 = fma(_652, (*spvDescriptorSet0.vp_c10)._m0[10].x, _664);
    float _674 = _466 * _666;
    float _676 = _494 + _652;
    float _678 = _670 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _680 = _470 * _672;
    float _682 = fma(_650, 0.300000011920928955078125, _668);
    float _684 = -_630;
    float _686 = fma(_684, 0.5, 0.5);
    float _688 = _670 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _690 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[10].y, _678);
    float _692 = _492 + _640;
    float _694 = _682 * _686;
    float _696 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[8].y, _688);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[10].x, _690);
    float _700 = _466 * _694;
    float _702 = _700 * 2.0;
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[8].x, _696);
    float _706 = _676 + _698;
    float _708 = _692 + _704;
    float _710 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].z, _706);
    float _712 = _670 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _714 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].x, _708);
    float _716 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _718 = _710 + _716;
    float _720 = fma(_674, (*spvDescriptorSet0.vp_c10)._m0[9].y, _712);
    float _722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _724 = _714 + _722;
    float _726 = _718 * _718;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c10)._m0[9].x, _720);
    float _730 = fma(_724, _724, _726);
    float _732 = _660 + _728;
    float _734 = sqrt(_730);
    float _736 = fma(_702, (*spvDescriptorSet0.vp_c8)._m0[32].y, _732);
    bool _738 = _734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _740 = _720;
    float _742 = _712;
    float _744 = _726;
    float _746 = _638;
    float _748 = _460;
    if (!_738)
    {
        _740 = _714;
    }
    float _750 = _740;
    float _752 = _750;
    if (!_738)
    {
        _742 = _710;
    }
    float _754 = _742;
    float _756 = _754;
    if (!_738)
    {
        _744 = _736;
    }
    float _758 = _744;
    bool _760 = !_738;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _734 + _766;
        float _770 = rsqrt(_730);
        float _772 = _768 * _764;
        float _774 = _736 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _776 = _772 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = fma(_784, _774, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _790 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _792 = _770 * _788;
        float _794 = fma(_736, _780, _790);
        float _796 = fma(_724, _792, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_718, _792, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _794;
        _752 = _796;
        _756 = _798;
    }
    float _800 = _762;
    float _802 = _752;
    float _804 = _756;
    float _806 = -_490;
    float _808 = _806 + _800;
    float _810 = -_492;
    float _812 = _810 + _802;
    float _814 = -_494;
    float _816 = _814 + _804;
    float _818 = _808 * _808;
    bool _820 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _822 = isnan(0.5);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _828 = _824 || _826;
    float _830 = fma(_812, _812, _818);
    float _832 = fma(_816, _816, _830);
    float _834 = sqrt(_832);
    bool _836 = _834 > 0.0;
    bool _838 = !_836;
    float _840 = _802;
    float _842 = _800;
    float _844 = _804;
    float _846 = _812;
    if (!_838)
    {
        float _848 = _168 * _168;
        float _850 = fma(_166, _166, _848);
        float _852 = fma(_170, _170, _850);
        float _854 = rsqrt(_832);
        float _856 = sqrt(_852);
        float _858 = _812 * _854;
        float _860 = _808 * _854;
        float _862 = _816 * _854;
        bool _864 = _856 > 0.0;
        bool _866 = !_864;
        if (!_866)
        {
            float _868 = rsqrt(_852);
            float _870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _872 = _168 * _868;
            float _874 = _166 * _868;
            float _876 = _170 * _868;
            float _878 = _860 * _872;
            float _880 = fma(_858, _874, _878);
            float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _884 = fma(_862, _876, _880);
            float _886 = _884 * _882;
            float _888 = fma(_166, _886, _802);
            float _890 = fma(_168, _886, _800);
            float _892 = fma(_170, _886, _804);
            _840 = _888;
            _842 = _890;
            _844 = _892;
            _846 = _880;
        }
    }
    float _894 = _840;
    float _896 = _842;
    float _898 = _844;
    float _900 = _846;
    float _902 = _900;
    if (_828)
    {
        _174 = _894;
    }
    float _904 = _174;
    float _906 = _904;
    if (_828)
    {
        _176 = _896;
    }
    float _908 = _176;
    float _910 = _908;
    if (_828)
    {
        _178 = _898;
    }
    float _912 = _178;
    float _914 = _912;
    if (!_828)
    {
        float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _918 = _490 + _916;
        float _920 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _922 = _492 + _920;
        float _924 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _926 = -_492;
        float _928 = _926 + _894;
        float _930 = _918 * _918;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _934 = _494 + _932;
        float _936 = -_490;
        float _938 = _936 + _896;
        float _940 = -_494;
        float _942 = _940 + _898;
        float _944 = fma(_922, _922, _930);
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _948 = fma(_934, _934, _944);
        float _950 = sqrt(_948);
        float _952 = _924 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _954 = precise::min(_950, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _956 = _954 * _946;
        float _958 = _952 * _956;
        float _960 = fma(_928, _958, _492);
        float _962 = fma(_938, _958, _490);
        float _964 = fma(_942, _958, _494);
        _910 = _962;
        _906 = _960;
        _914 = _964;
    }
    float _966 = _910;
    float _968 = _906;
    float _970 = _914;
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _966 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _978 = _968 + _976;
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = fma(_978, _978, _984);
    float _988 = fma(_982, _982, _986);
    float _990 = rsqrt(_988);
    float _992 = _990 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _994 = _978 * _992;
    float _996 = _982 * _992;
    float _998 = _994 * _994;
    float _1000 = _996 * _996;
    float _1002 = _998 + _1000;
    float _1004 = sqrt(_1002);
    bool _1006 = _1004 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1010 = _1004 + _1008;
    float _1012 = _982;
    float _1014 = _1002;
    float _1016 = _1010;
    float _1018 = _992;
    bool _1020 = _1006;
    if (_1006)
    {
        float _1022 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1012 = _1022;
    }
    float _1024 = _1012;
    if (_1006)
    {
        float _1026 = rsqrt(_1002);
        _1014 = _1026;
    }
    float _1028 = _1014;
    if (_1006)
    {
        float _1030 = _1010 * _1024;
        _1016 = _1030;
    }
    float _1032 = _1016;
    if (_1006)
    {
        float _1034 = _1032 * 0.15915493667125701904296875;
        _902 = _1034;
    }
    float _1036 = _902;
    float _1038 = _984;
    float _1040 = _1036;
    if (_1006)
    {
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = sin(_1042);
        _1038 = _1044;
    }
    float _1046 = _1038;
    float _1048 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1050 = precise::max(0.0, _1048);
    float _1052 = _990;
    float _1054 = _1050;
    float _1056 = _1048;
    if (_1006)
    {
        float _1058 = _1036 * 6.283185482025146484375;
        float _1060 = cos(_1058);
        _1052 = _1060;
    }
    float _1062 = _1052;
    float _1064 = -_992;
    float _1066 = -_1050;
    float _1068 = fma(_974, _1064, _1066);
    float _1070 = _1068;
    if (!_1006)
    {
        _1054 = _994;
    }
    float _1072 = _1054;
    float _1074 = _1072;
    if (_1006)
    {
        float _1076 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1056 = _1076;
    }
    float _1078 = _1056;
    float _1080 = _1046;
    float _1082 = _1078;
    if (_1006)
    {
        float _1084 = fma(_1046, _1078, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1080 = _1084;
    }
    float _1086 = _1080;
    float _1088 = _1086;
    float _1090 = _1062;
    if (_1006)
    {
        float _1092 = _1062 + (-1.0);
        _1082 = _1092;
    }
    float _1094 = _1082;
    float _1096 = _1094;
    if (_1006)
    {
        float _1098 = _1028 * _1086;
        _1018 = _1098;
    }
    float _1100 = _1018;
    if (!_1006)
    {
        _1088 = _998;
    }
    float _1102 = _1088;
    float _1104 = sqrt(_988);
    float _1106 = _1102;
    if (_1006)
    {
        float _1108 = _1094 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1040 = _1108;
    }
    float _1110 = _1040;
    if (_1006)
    {
        float _1112 = _994 * _1100;
        _1074 = _1112;
    }
    float _1114 = _1074;
    if (!_1006)
    {
        _1096 = _996;
    }
    float _1116 = _1096;
    float _1118 = _1116;
    if (_1006)
    {
        float _1120 = _996 * _1100;
        _1118 = _1120;
    }
    float _1122 = _1118;
    if (_1006)
    {
        float _1124 = fma(_1068, _1062, _1110);
        _1070 = _1124;
    }
    float _1126 = _1070;
    if (_1006)
    {
        float _1128 = _1114 * _1114;
        _1106 = _1128;
    }
    float _1130 = _1106;
    if (!_1006)
    {
        _1090 = _1000;
    }
    float _1132 = _1090;
    float _1134 = _1132;
    if (_1006)
    {
        float _1136 = _1122 * _1122;
        _1134 = _1136;
    }
    float _1138 = _1134;
    float _1140 = fma(_1126, _1126, _1130);
    float _1142 = _1140 + _1138;
    float _1144 = _966 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1146);
    float _1150 = precise::clamp(_1148, 0.0, 1.0);
    float _1152 = _966 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1154 = rsqrt(_1142);
    float _1156 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1144);
    float _1158 = _966 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1160 = -_1150;
    float _1162 = _1160 + 1.0;
    float _1164 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1166 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1156);
    float _1168 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1152);
    float _1170 = _966 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1172 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1158);
    float _1174 = abs(_1162);
    float _1176 = log2(_1174);
    float _1178 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1180 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1170);
    float _1182 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1184 = _1166 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1180);
    float _1190 = _1154 * _1114;
    float _1192 = _1154 * _1126;
    float _1194 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1200 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1202 = _1154 * _1122;
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = -_1198;
    float _1208 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1206);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1212 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1214 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1216 = -_1202;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1208);
    float _1220 = -_1210;
    float _1222 = fma(_1220, _1164, 1.0);
    float _1224 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1226 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1214);
    float _1228 = fma(_1218, -0.5, 0.5);
    float _1230 = exp2(_1212);
    float _1232 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1234 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1224);
    float _1236 = fma(_1218, 0.5, 0.5);
    float _1238 = _1192 + 1.0;
    float _1240 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1232);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1234);
    float _1244 = fma(_1236, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1246 = log2(_1222);
    float _1248 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1240);
    float _1250 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1252 = fma(_1236, _1244, -0.212114393711090087890625);
    float _1254 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1248);
    float _1256 = fma(_1236, _1252, 1.570728778839111328125);
    float _1258 = 1.0 / _1226;
    float _1260 = -_1192;
    float _1262 = fma(_1230, _1238, _1260);
    float _1264 = sqrt(_1228);
    float _1266 = _1246 * 0.693147182464599609375;
    float _1268 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1270 = _1254 * _1258;
    float _1272 = _1250 * _1258;
    float _1274 = fma(_1270, 0.5, 0.5);
    float _1276 = fma(_1272, -0.5, 0.5);
    float _1278 = _1264 * 0.636619746685028076171875;
    float3 _3938 = float3(_1274, _1276, _1268);
    float _1280 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3938, float3(0.0), isnan(_3938)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3938, float3(0.0), isnan(_3938)), level(0.0)).x;
    float _1282 = -_1256;
    float _1284 = fma(_1278, _1282, 1.0);
    float _1286 = fma(_1262, 0.5, 0.5);
    float3 _3956 = float3(_1274, _1276, _1268);
    float4 _1289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3956, float3(0.0), isnan(_3956)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3956, float3(0.0), isnan(_3956)), level(0.0)).xyzw;
    float _1291 = _1289.x;
    float _1293 = _1289.y;
    float _1295 = _1289.z;
    float _1297 = _1289.w;
    float2 _3973 = float2(_1284, _1286);
    float3 _1301 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3973, float2(0.0), isnan(_3973)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3973, float2(0.0), isnan(_3973)), level(0.0)).xyz;
    float _1303 = _1301.x;
    float _1305 = _1301.y;
    float _1307 = _1301.z;
    float _1309 = in.m_57.x;
    float _1311 = -_630;
    float _1313 = _1311 + 1.0;
    float _1315 = in.m_51.y;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = _462 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1325 = _1323 != 0;
    float _1327 = in.m_51.w;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1331 = _1329 != 0;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1339 = _1337 != 0;
    float _1341 = in.m_59.z;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1345 = _1343 != 0;
    float _1347 = in.m_59.w;
    float _1349 = 1.0 / _1335;
    int _1351 = as_type<int>(_1268);
    if (_1319)
    {
        bool _1353 = _462 > 0.5;
        _1020 = _1353;
    }
    bool _1355 = _1020;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1361 = _460 > 0.5;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1367 = _1309;
    if (_1319)
    {
        float _1369 = -_1309;
        float _1371 = _1369 + 1.0;
        _1351 = as_type<int>(_1371);
    }
    int _1373 = _1351;
    if (!_1319)
    {
        _746 = _1309;
    }
    float _1375 = _746;
    float _1377 = 1.0 / _1359;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1381 = _1379 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1383 = _1375;
    if (_1319)
    {
        float _1385 = _1355 ? as_type<float>(_1373) : _1309;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1391 = _1315 > 0.5;
    int _1393 = 0;
    if (_1331)
    {
        float _1395 = -_1309;
        float _1397 = _1395 + 1.0;
        _1393 = as_type<int>(_1397);
    }
    int _1399 = _1393;
    int _1401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1403 = _1401 != 0;
    float _1405 = 1.0 / _1381;
    int _1407 = _1391 ? as_type<int>(_1313) : as_type<int>(_630);
    out.m_61.z = _1341;
    float _1409 = _1339 ? as_type<float>(_1407) : _630;
    out.m_61.w = _1347;
    bool _1411 = _1327 > 0.5;
    float _1413 = 1.0 / _1365;
    int _1415 = _1361 ? as_type<int>(_1313) : as_type<int>(_630);
    int _1417 = _1411 ? as_type<int>(_1313) : as_type<int>(_630);
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1421 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1423 = isnan(0.5);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1429 = _1425 || _1427;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1435 = -_1419;
    float _1437 = fma(_1321, 2.0, _1435);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1441 = _1345 ? as_type<float>(_1415) : _630;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1447 = _1445 != 0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1451 = fma(_1389, -2.0, _1431);
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1455 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1473 = _1471 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1477 = _1475 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    out.m_63.x = _1455;
    out.m_63.y = _1459;
    out.m_63.z = _1461;
    out.m_63.w = _1457;
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1481 = _1465 * _1349;
    float _1483 = _1469 * _1377;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1487 = _450 + _1485;
    float _1489 = _1473 * _1405;
    float _1491 = _1477 * _1413;
    float _1493 = _1403 ? as_type<float>(_1417) : _630;
    float _1495 = fma(_1481, _1487, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1497 = _1433 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1499 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1501 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1503 = isnan(_450);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_126;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1437);
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1519 = _450 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1523 = _450 + _1521;
    float _1525 = fma(_1497, _1409, -0.5);
    float _1527 = fma(_1493, _1499, -0.5);
    float _1529 = fma(_1483, _1519, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1531 = fma(_1489, _1523, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    bool _1533 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1535 = isnan(_450);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = -_1511;
    float _1547 = _1545 + 1.0;
    float _1549 = _1499;
    if (!_1447)
    {
        _1549 = _1315;
    }
    float _1551 = _1549;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1555 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1557 = isnan(_450);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1569 = -_1543;
    float _1571 = _1569 + 1.0;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1575 = _450 + _1573;
    float _1577 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1579 = _1543 * _1547;
    float _1581 = _1553;
    float _1583 = _1551;
    float _1585 = _1571;
    float _1587 = _1579;
    if (!_1447)
    {
        _1581 = _1551;
    }
    float _1589 = _1581;
    float _1591 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1593 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1567);
    float _1595 = _1589;
    if (_1447)
    {
        _1583 = _1315;
    }
    float _1597 = _1583;
    float _1599 = _1565 * _1571;
    bool _1601 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1603 = isnan(_450);
    bool _1605 = _1601 || _1603;
    bool _1607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1609 = _1605 || _1607;
    float _1611 = float(_1609);
    float _1613 = fma(_1491, _1575, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1615 = -_1565;
    float _1617 = _1615 + 1.0;
    float _1619 = fma(_1441, _1591, -0.5);
    bool _1621 = _450 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1623 = isnan(_450);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1577);
    float _1635 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1451);
    float _1637 = _1611 * _1617;
    float _1639 = -_1611;
    float _1641 = _1639 + 1.0;
    int _1643 = as_type<int>(_1633);
    float _1645 = _1597;
    if (_1447)
    {
        _1585 = _462;
    }
    float _1647 = _1585;
    float _1649 = -_1635;
    float _1651 = fma(_1633, _1525, _1649);
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1655 = _1647;
    if (!_1447)
    {
        _1655 = _460;
    }
    float _1657 = _1655;
    float _1659 = _1631 * _1641;
    float _1661 = -_1631;
    float _1663 = _1661 + 1.0;
    if (_1447)
    {
        _1595 = _462;
    }
    float _1665 = _1595;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1669 = _1495 * _1659;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1673 = _1667;
    float _1675 = _1669;
    if (_1325)
    {
        float _1677 = -_1309;
        float _1679 = _1677 + 1.0;
        _1643 = as_type<int>(_1679);
    }
    int _1681 = _1643;
    float _1683 = -_1653;
    float _1685 = fma(_1667, 2.0, _1683);
    float _1687 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1671);
    float _1689 = fma(_1663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1669);
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_1325)
    {
        _1673 = _1309;
    }
    float _1693 = _1673;
    float _1695 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1697 = _1693;
    if (!_1447)
    {
        _1675 = _460;
    }
    float _1699 = _1675;
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1703 = _1699;
    if (_1325)
    {
        float _1705 = _1361 ? as_type<float>(_1681) : _1309;
        _1697 = _1705;
    }
    float _1707 = _1697;
    float _1709 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1447)
    {
        _748 = _1597;
    }
    float _1711 = _748;
    float _1713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1331)
    {
        float _1715 = _1391 ? as_type<float>(_1399) : _1309;
        _1367 = _1715;
    }
    float _1717 = _1367;
    float _1719 = -_1701;
    float _1721 = fma(_1695, 2.0, _1719);
    float _1723 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1709);
    float _1725 = _490 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1447)
    {
        _1703 = _1597;
    }
    float _1727 = _1703;
    float _1729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1733 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1735 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1725);
    if (!_1447)
    {
        _1645 = _462;
    }
    float _1737 = _1645;
    float _1739 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1731);
    float _1741 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1733);
    float _1743 = _490 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1745 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1749 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1743);
    float _1751 = _1713 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = fma(_1613, _1637, _1689);
    float _1757 = fma(_1747, _1387, -0.5);
    float _1759 = _1729 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1763 = 1.0 / _1753;
    float _1765 = _1727 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1767 = fma(_494, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1749);
    float _1769 = fma(_1751, _1707, -0.5);
    float _1771 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1687);
    float _1773 = -_126;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1721);
    float _1777 = fma(_1765, -2.0, _1761);
    float _1779 = fma(_1529, _1599, _1755);
    float _1781 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1739);
    float _1783 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1785 = fma(_1759, _1717, -0.5);
    float _1787 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1741);
    float _1789 = -_126;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1685);
    float _1793 = fma(_1771, _1769, _1775);
    float _1795 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1723);
    float _1797 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1777);
    float _1799 = fma(_1781, _1757, _1515);
    float _1801 = _1783 + _1753;
    float _1803 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1805 = _1737 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1807 = fma(_1787, _1785, _1791);
    float _1809 = _1785;
    if (!_1429)
    {
        _1809 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1811 = _1809;
    float _1813 = -_1797;
    float _1815 = fma(_1795, _1527, _1813);
    float _1817 = _1801 * _1763;
    float _1819 = _1817 * 0.5;
    float _1821 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = fma(_1805, -2.0, _1803);
    float _1825 = fma(_1531, _1579, _1779);
    float _1827 = _1819;
    if (!_1429)
    {
        float _1829 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1831 = fma(_1819, _1811, _1829);
        _1827 = _1831;
    }
    float _1833 = _1827;
    float _1835 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1593);
    float _1837 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1839 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1823);
    float _1841 = _1839;
    if (!_1429)
    {
        _1587 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1843 = _1587;
    float _1845 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1847 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = -_1839;
    float _1851 = fma(_1835, _1619, _1849);
    float _1853 = _1833;
    if (!_1429)
    {
        float _1855 = 1.0 / _1833;
        _1853 = _1855;
    }
    float _1857 = _1853;
    if (!_1429)
    {
        float _1859 = -_1843;
        float _1861 = _1859 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1841 = _1861;
    }
    float _1863 = _1841;
    float _1865 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1825);
    float _1867 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1869 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1871 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1873 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1875 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1877 = exp2(_1847);
    float _1879 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1429)
    {
        _420 = 1.0;
    }
    float _1881 = _420;
    float _1883 = _1793 + 0.5;
    float _1885 = _1651 + 0.5;
    float _1887 = _1799 + 0.5;
    out.m_65.x = _1871;
    out.m_65.y = _1875;
    out.m_65.z = _1879;
    out.m_65.w = _1873;
    float _1889 = _1815 + 0.5;
    float _1891 = _1803;
    float _1893 = _1881;
    if (!_1429)
    {
        float _1895 = 1.0 / _1863;
        _1891 = _1895;
    }
    float _1897 = _1891;
    if (!_1429)
    {
        float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1901 = -_1843;
        float _1903 = fma(_1857, _1899, _1901);
        _422 = _1903;
    }
    float _1905 = _422;
    float _1907 = _1226 * 0.5;
    out.m_67.x = _1887;
    out.m_67.y = _1885;
    out.m_67.z = _1883;
    out.m_67.w = _1889;
    float _1909 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1837);
    float _1911 = _1254 + _1226;
    float _1913 = _1851 + 0.5;
    float _1915 = -_1877;
    float _1917 = _1915 + 1.0;
    float _1919 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1909);
    float _1921 = _1911 * 0.5;
    float _1923 = fma(_1250, -0.5, _1907);
    if (!_1429)
    {
        float _1925 = _1905 * _1897;
        float _1927 = precise::clamp(_1925, 0.0, 1.0);
        _1893 = _1927;
    }
    float _1929 = _1893;
    float _1931 = _1917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1933 = _1807 + 0.5;
    float _1935 = _1919 + _1226;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1939 = _1929 > 0.0;
    bool _1941 = isnan(_1929);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(0.0);
    bool _1947 = _1943 || _1945;
    float _1949 = -_1931;
    float _1951 = _1949 + 1.0;
    out.gl_Position.x = _1254;
    out.gl_Position.y = _1250;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1226;
    float _1953 = _1937 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1955 = _1935 * 0.5;
    out.m_69.x = _1933;
    out.m_69.y = _1913;
    out.m_71.x = _1921;
    out.m_71.y = _1923;
    out.m_71.z = _1955;
    out.m_71.w = _1226;
    out.m_45.x = _1953;
    float _1957 = _1931 * _1280;
    float _1959 = _1297 * _1957;
    float _1961 = _1297 * _1951;
    float _1963 = _1307 * _1957;
    float _1965 = fma(_1303, _1959, _1291);
    float _1967 = fma(_1305, _1959, _1293);
    float _1969 = fma(_1297, _1963, _1295);
    out.m_73.x = _1965;
    out.m_73.y = _1967;
    out.m_73.z = _1969;
    out.m_73.w = _1961;
    if (_1947)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1971 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1971;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

