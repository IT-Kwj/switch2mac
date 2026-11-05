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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_73 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_122);
        out.gl_Position.z = _1523;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_158);
        out.gl_Position.z = _1592;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _180 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _186 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _190 = _182 * _184;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _200 = _192 * _194;
    float _202 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _204 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _206 = _198 * _188;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _210 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _202);
    float _212 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _214 = _200 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _216 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _208);
    float _218 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _210);
    float _220 = _212 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _214);
    float _224 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _216);
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _230 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _222);
    float _232 = _220 + _224;
    float _234 = _200 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _228);
    float _238 = _226 + _230;
    float _240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _242 = _232 + _240;
    float _244 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _234);
    float _246 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _236);
    float _248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _250 = _238 + _248;
    float _252 = _242 * _242;
    float _254 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _244);
    float _256 = _246 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _258 = fma(_250, _250, _252);
    float _260 = _256 + _254;
    float _262 = sqrt(_258);
    bool _264 = _262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _266 = !_264;
    float _268 = _260;
    float _270 = _238;
    float _272 = _232;
    float _274 = _254;
    float _276 = _190;
    float _278 = _256;
    if (!_266)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _262 + _282;
        float _286 = _260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_258);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = sin(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = cos(_298);
        float _302 = fma(_296, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _304 = _288 * _302;
        float _306 = _300 + (-1.0);
        float _308 = fma(_250, _304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _310 = fma(_242, _304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _312 = _306 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _314 = fma(_260, _300, _312);
        _268 = _314;
        _270 = _308;
        _272 = _310;
    }
    float _316 = _268;
    float _318 = _270;
    float _320 = _272;
    float _322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _324 = _316 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _328 = _318 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _332 = _320 + _330;
    float _334 = _324 * _324;
    float _336 = fma(_328, _328, _334);
    float _338 = fma(_332, _332, _336);
    float _340 = rsqrt(_338);
    float _342 = sqrt(_338);
    float _344 = _340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _346 = _328 * _344;
    float _348 = _332 * _344;
    float _350 = _346 * _346;
    float _352 = _348 * _348;
    float _354 = _350 + _352;
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _356 + _360;
    float _364 = _340;
    float _366 = _362;
    float _368 = _324;
    float _370 = _344;
    float _372 = _350;
    if (_358)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _364 = _374;
    }
    float _376 = _364;
    if (_358)
    {
        float _378 = rsqrt(_354);
        _274 = _378;
    }
    float _380 = _274;
    float _382 = _380;
    if (_358)
    {
        float _384 = _362 * _376;
        _366 = _384;
    }
    float _386 = _366;
    if (_358)
    {
        float _388 = _386 * 0.15915493667125701904296875;
        _276 = _388;
    }
    float _390 = _276;
    float _392 = _376;
    if (_358)
    {
        float _394 = _390 * 6.283185482025146484375;
        float _396 = sin(_394);
        _392 = _396;
    }
    float _398 = _392;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _402 = precise::max(0.0, _400);
    float _404 = _332;
    float _406 = _402;
    if (_358)
    {
        float _408 = _390 * 6.283185482025146484375;
        float _410 = cos(_408);
        _404 = _410;
    }
    float _412 = _404;
    float _414 = -_344;
    float _416 = -_402;
    float _418 = fma(_324, _414, _416);
    if (_358)
    {
        float _420 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _406 = _420;
    }
    float _422 = _406;
    float _424 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _426 = _398;
    float _428 = _422;
    if (_358)
    {
        float _430 = fma(_398, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _368 = _430;
    }
    float _432 = _368;
    float _434 = _432;
    if (!_358)
    {
        _426 = _346;
    }
    float _436 = _426;
    float _438 = _436;
    float _440 = _412;
    if (_358)
    {
        float _442 = _412 + (-1.0);
        _428 = _442;
    }
    float _444 = _428;
    float _446 = 0.0;
    if (_358)
    {
        float _448 = _380 * _432;
        _446 = _448;
    }
    float _450 = _446;
    if (!_358)
    {
        _382 = _418;
    }
    float _452 = _382;
    float _454 = _452;
    if (_358)
    {
        float _456 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _456;
    }
    float _458 = _370;
    if (_358)
    {
        float _460 = _346 * _450;
        _438 = _460;
    }
    float _462 = _438;
    if (!_358)
    {
        _434 = _348;
    }
    float _464 = _434;
    float _466 = _464;
    if (_358)
    {
        float _468 = _348 * _450;
        _466 = _468;
    }
    float _470 = _466;
    if (_358)
    {
        float _472 = fma(_418, _412, _458);
        _454 = _472;
    }
    float _474 = _454;
    if (_358)
    {
        float _476 = _462 * _462;
        _372 = _476;
    }
    float _478 = _372;
    if (!_358)
    {
        _440 = _352;
    }
    float _480 = _440;
    float _482 = _480;
    if (_358)
    {
        float _484 = _470 * _470;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_474, _474, _478);
    float _490 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _492 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _494 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _496 = _488 + _486;
    float _498 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _500 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _424);
    float _502 = floor(_494);
    float _504 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _492);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _508 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _512 = fma(_342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _510);
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _490);
    float _518 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _506);
    float _520 = _508 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _522 = rsqrt(_496);
    float _524 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _528 = _520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = _524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _536 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _504);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _528);
    float _540 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _542 = -_502;
    float _544 = _494 + _542;
    float _546 = abs(_532);
    float _548 = log2(_546);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[7].z, _538);
    float _552 = _536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _554 = _520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _556 = _522 * _462;
    float _558 = _522 * _474;
    float _560 = _522 * _470;
    float _562 = _556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _550);
    float _566 = floor(_540);
    float _568 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _554);
    float _570 = -_562;
    float _572 = fma(_558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _570);
    float _574 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _576 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _578 = -_560;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c15)._m0[21].z, _572);
    float _582 = _534 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _584 = exp2(_576);
    float _586 = fma(_580, -0.5, 0.5);
    float _588 = fma(_580, 0.5, 0.5);
    float _590 = -_582;
    float _592 = fma(_590, _574, 1.0);
    float _594 = _520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _596 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[4].z, _568);
    float _598 = fma(_588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _600 = 1.0 / _564;
    float _602 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _594);
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _596);
    float _606 = -_566;
    float _608 = _540 + _606;
    float _610 = fma(_588, _598, -0.212114393711090087890625);
    float _612 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[5].z, _602);
    float _614 = _558 + 1.0;
    float _616 = log2(_592);
    float _618 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _612);
    float _620 = -_558;
    float _622 = fma(_584, _614, _620);
    float _624 = sqrt(_586);
    float _626 = _604 * _600;
    float _628 = _618 * _600;
    float2 _2399 = float2(_544, _608);
    float _630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2399, float2(0.0), isnan(_2399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2399, float2(0.0), isnan(_2399)), level(0.0)).x;
    float _632 = fma(_588, _610, 1.570728778839111328125);
    float _634 = fma(_626, 0.5, 0.5);
    float _636 = fma(_628, -0.5, 0.5);
    float _638 = fma(_622, 0.5, 0.5);
    float _640 = _616 * 0.693147182464599609375;
    float _642 = _640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _644 = _624 * 0.636619746685028076171875;
    float3 _2430 = float3(_634, _636, _642);
    float _646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2430, float3(0.0), isnan(_2430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2430, float3(0.0), isnan(_2430)), level(0.0)).x;
    float _648 = -_632;
    float _650 = fma(_644, _648, 1.0);
    float3 _2446 = float3(_634, _636, _642);
    float4 _653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2446, float3(0.0), isnan(_2446)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2446, float3(0.0), isnan(_2446)), level(0.0)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2462 = float2(_650, _638);
    float3 _665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2462, float2(0.0), isnan(_2462)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2462, float2(0.0), isnan(_2462)), level(0.0)).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float _673 = in.m_57.x;
    float _675 = in.m_57.y;
    float _677 = _256 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _679 = in.m_57.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _683 = _681 != 0;
    float _685 = _256 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_59.w;
    float _693 = _520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _695 = in.m_61.x;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 0.0;
    bool _715 = _683;
    float _717 = _618;
    if (!_683)
    {
        float _719 = in.m_57.z;
        _713 = _719;
    }
    float _721 = _713;
    float _723 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _693);
    float _725 = 0.0;
    if (_689)
    {
        float _727 = in.m_57.x;
        _725 = _727;
    }
    float _729 = _725;
    float _731 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _733 = _675 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _735 = in.m_61.y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _679 > 0.5;
    float _741 = -_701;
    float _743 = fma(_731, 2.0, _741);
    float _745 = fma(_733, -2.0, _707);
    float _747 = 0.0;
    if (!_683)
    {
        _747 = _675;
    }
    float _749 = _747;
    out.m_63.w = _691;
    float _751 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    float _753 = _749;
    if (_683)
    {
        _753 = _673;
    }
    float _755 = _753;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _759 = in.m_65.x;
    float _761 = in.m_65.y;
    float _763 = in.m_65.z;
    float _765 = in.m_65.w;
    float _767 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _677);
    float _769 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _777 = _721;
    float _779 = _775;
    if (!_683)
    {
        _278 = _721;
    }
    float _781 = _278;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _787 = _781;
    if (_683)
    {
        _787 = _675;
    }
    float _789 = _787;
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _789;
    if (_683)
    {
        _777 = _675;
    }
    float _795 = _777;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_689)
    {
        bool _799 = _729 > 0.5;
        _715 = _799;
    }
    bool _801 = _715;
    float _803 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _805 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _811 = _675 > 0.5;
    float _813 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[78].w, _757);
    float _815 = -_735;
    float _817 = _815 + 1.0;
    out.m_67.x = _791;
    out.m_67.y = _805;
    out.m_67.z = _807;
    out.m_67.w = _797;
    float _819 = _761 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _821 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _735;
    bool _825 = _811;
    if (!_689)
    {
        _779 = _695;
    }
    float _827 = _779;
    float _829 = 1.0 / _803;
    float _831 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _819);
    float _833 = _737;
    float _835 = _831;
    float _837 = _827;
    if (_699)
    {
        float _839 = in.m_57.z;
        _833 = _839;
    }
    float _841 = _833;
    int _843 = _811 ? as_type<int>(_817) : as_type<int>(_735);
    float _845 = _821 + _803;
    float _847 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _849 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[6].z, _723);
    float _851 = _705 ? as_type<float>(_843) : _735;
    if (_711)
    {
        float _853 = _739 ? _817 : _735;
        _823 = _853;
    }
    float _855 = _823;
    float _857 = _761 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = _761 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _831);
    if (!_689)
    {
        _835 = _827;
    }
    float _863 = _835;
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _867 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _859);
    float _869 = _863;
    if (_689)
    {
        _837 = _695;
    }
    float _871 = _837;
    float _873 = _845 * _829;
    float _875 = _873 * 0.5;
    float _877 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _865);
    float _879 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _881 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _883 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _849);
    float _885 = fma(_881, _851, -0.5);
    out.m_69.x = _877;
    out.m_69.y = _879;
    out.m_69.z = _861;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
    float _891 = _871;
    float _893 = _883;
    if (_699)
    {
        bool _895 = _841 > 0.5;
        _825 = _895;
    }
    bool _897 = _825;
    float _899 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _903 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _745);
    float _905 = in.m_71.x;
    float _907 = in.m_71.y;
    float _909 = in.m_71.z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _915 = -_903;
    float _917 = fma(_899, _885, _915);
    float _919 = 1.0 / _889;
    bool _921 = _168 != 0.0;
    bool _923 = isnan(_168);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].z, _913);
    float _933 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _935 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _937 = _166 == 0.0;
    bool _939 = !_929;
    bool _941 = _937 && _939;
    out.gl_Position.x = _604;
    out.gl_Position.y = _618;
    out.gl_Position.z = _883;
    out.gl_Position.w = _564;
    float _943 = -_911;
    float _945 = fma(_933, 2.0, _943);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _901 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _951 = _170 == 0.0;
    bool _953 = _951 && _941;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    int _957 = as_type<int>(_949);
    if (_689)
    {
        float _959 = -_871;
        float _961 = _959 + 1.0;
        _955 = as_type<int>(_961);
    }
    int _963 = _955;
    float _965 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    float _967 = fma(_949, _855, -0.5);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_699)
    {
        float _971 = -_871;
        float _973 = _971 + 1.0;
        _957 = as_type<int>(_973);
    }
    int _975 = _957;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _979 = _919 * _977;
    if (_689)
    {
        float _981 = _801 ? as_type<float>(_963) : _871;
        _869 = _981;
    }
    float _983 = _869;
    float _985 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _987 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _965);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_699)
    {
        float _991 = _897 ? as_type<float>(_975) : _871;
        _891 = _991;
    }
    float _993 = _891;
    float _995 = abs(_979);
    float _997 = log2(_995);
    float _999 = _905;
    if (_953)
    {
        _793 = _907;
    }
    float _1001 = _793;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1005 = _1001;
    float _1007 = _1003;
    if (_953)
    {
        _989 = _905;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (!_953)
    {
        float _1013 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = fma(_985, -2.0, _1003);
    if (_953)
    {
        _1007 = _1009;
    }
    float _1019 = _1007;
    float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1023 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1025 = _1019;
    if (!_953)
    {
        _1011 = _905;
    }
    float _1027 = _1011;
    float _1029 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1017);
    if (_953)
    {
        _999 = _909;
    }
    float _1031 = _999;
    float _1033 = fma(_1023, _983, -0.5);
    float _1035 = -_140;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[76].x, _743);
    float _1039 = -_140;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _945);
    float _1043 = _997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1045 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1047 = _763 * _1027;
    float _1049 = _1031;
    if (!_953)
    {
        float _1051 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1027);
        _1025 = _1051;
    }
    float _1053 = _1025;
    float _1055 = exp2(_935);
    float _1057 = -_1047;
    float _1059 = fma(_759, _909, _1057);
    float _1061 = _761 * _909;
    float _1063 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1065 = _759 * _907;
    float _1067 = _1059 * _765;
    float _1069 = -_1061;
    float _1071 = fma(_763, _907, _1069);
    float _1073 = fma(_1063, _993, -0.5);
    float _1075 = exp2(_1043);
    float _1077 = -_1065;
    float _1079 = fma(_761, _1027, _1077);
    float _1081 = _1071 * _765;
    float _1083 = fma(_1045, _1073, _1041);
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _1079 * _765;
    float _1089 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_953)
    {
        float _1091 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _1049 = _1091;
    }
    float _1093 = _1049;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1097 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1101 = _979 <= 8000.0;
    bool _1103 = isnan(_979);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(8000.0);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1089);
    float _1115 = fma(_847, _1033, _1037);
    float _1117 = -_1029;
    float _1119 = fma(_987, _967, _1117);
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1127 = in.m_73.x;
    float _1129 = _1119 + 0.5;
    float _1131 = fma(_1123, -2.0, 3.0);
    float _1133 = _1123 * _1123;
    float _1135 = -_1055;
    float _1137 = _1135 + 1.0;
    bool _1139 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1141 = isnan(_342);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1147 = _1143 || _1145;
    float _1149 = _1133 * _1131;
    float _1151 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = -_1149;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1159 = _1083 + 0.5;
    float _1161 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1149);
    float _1163 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1165 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1167 = _917 + 0.5;
    float _1169 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1173 = _1111 * _1161;
    float _1175 = _1115 + 0.5;
    float _1177 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1099);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1171);
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_75.x = _1175;
    out.m_75.y = _1167;
    out.m_75.z = _1159;
    out.m_75.w = _1129;
    if (!_1147)
    {
        _893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _893;
    float _1191 = _1189;
    float _1193 = _1189;
    if (!_1147)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1195 = _717;
    out.m_77.x = _1163;
    out.m_77.y = _1165;
    out.m_77.z = _1125;
    out.m_79.x = _1181;
    out.m_79.y = _1183;
    out.m_79.z = _1185;
    float _1197 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = -_630;
    float _1201 = _1199 + 1.0;
    float _1203 = _1201 * _1187;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1205;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1211 = _1209 * _1127;
    float _1213 = _1197 * _646;
    float _1215 = -_1197;
    float _1217 = _1215 + 1.0;
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1221 = _661 * _1213;
    float _1223 = _661 * _1217;
    out.m_81.x = _1219;
    float _1225 = _671 * _1213;
    float _1227 = fma(_667, _1221, _655);
    float _1229 = fma(_669, _1221, _657);
    float _1231 = _1221;
    float _1233 = _1195;
    float _1235 = _1195;
    if (!_1147)
    {
        _1231 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1237 = _1231;
    float _1239 = fma(_661, _1225, _659);
    out.m_83.x = _1227;
    out.m_83.y = _1229;
    out.m_83.z = _1239;
    out.m_83.w = _1223;
    bool _1241 = !_1147;
    float _1243 = _1237;
    float _1245 = _1237;
    if (!_1241)
    {
        bool _1247 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1249 = isnan(_342);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1255 = _1251 || _1253;
        if (!_1255)
        {
            float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1259 = _342 + _1257;
            float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1261;
            float _1265 = 1.0 / _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1275 = _1259 * _1265;
            float _1277 = precise::clamp(_1275, 0.0, 1.0);
            float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1281 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1283 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1285 = fma(_1277, _1281, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1287 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1235 = _1287;
            _1193 = _1285;
            _1245 = _1283;
            _1289 = true;
        }
        else
        {
            bool _1291 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1293 = isnan(_342);
            bool _1295 = _1291 || _1293;
            bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1299 = _1295 || _1297;
            if (!_1299)
            {
                _1191 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1301 = _1191;
            _1193 = _1301;
            if (!_1299)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1303 = _1233;
            _1235 = _1303;
            if (!_1299)
            {
                _1243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1305 = _1243;
            bool _1307 = !_1299;
            _1245 = _1305;
            if (!_1307)
            {
                bool _1309 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1311 = isnan(_342);
                bool _1313 = _1309 || _1311;
                bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1317 = _1313 || _1315;
                if (!_1317)
                {
                    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1321 = _342 + _1319;
                    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1323;
                    float _1327 = 1.0 / _1325;
                    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1331 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1335 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1337 = _1321 * _1327;
                    float _1339 = precise::clamp(_1337, 0.0, 1.0);
                    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1343 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1345 = fma(_1339, _1335, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1347 = fma(_1339, _1343, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1349 = fma(_1339, _1331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1235 = _1349;
                    _1193 = _1347;
                    _1245 = _1345;
                    _1289 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1193 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1289 = false;
    float _1351 = _1235;
    float _1353 = _1193;
    float _1355 = _1245;
    float _1357 = _1351 * 0.586610972881317138671875;
    bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_85.x = 0.0;
    float _1361 = fma(_1353, 0.298911988735198974609375, _1357);
    float _1363 = fma(_1355, 0.114477999508380889892578125, _1361);
    out.m_49.x = 1.0;
    float _1365 = -_1363;
    float _1367 = _1365 + _1353;
    float _1369 = -_1363;
    float _1371 = _1369 + _1351;
    float _1373 = -_1363;
    float _1375 = _1373 + _1355;
    float _1377 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1381 = fma(_1371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    out.m_81.w = _1377;
    out.m_87.x = _1379;
    out.m_87.y = _1381;
    out.m_87.z = _1383;
    if (!_1359)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1385 = -_316;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1389 = -_318;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1393 = -_320;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = sqrt(_1401);
    float _1405 = rsqrt(_1401);
    float _1407 = -_1403;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1411 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = _1391 * _1405;
    float _1417 = _1387 * _1405;
    float _1419 = abs(_1413);
    float _1421 = log2(_1419);
    float _1423 = _1395 * _1405;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1427 = _1183 * _1417;
    float _1429 = -_1417;
    float _1431 = -_1425;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1431);
    float _1435 = fma(_1181, _1415, _1427);
    float _1437 = -_1423;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1433);
    float _1441 = fma(_1185, _1423, _1435);
    float _1443 = precise::clamp(_1441, 0.0, 1.0);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1447 = _1439 + _1445;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = exp2(_1449);
    float _1457 = _1455 * _1453;
    float _1459 = _1443 * _1457;
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1463 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1465 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1461;
    out.m_85.y = _1463;
    out.m_85.z = _1465;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_122);
        out.gl_Position.z = _1523;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_158);
        out.gl_Position.z = _1592;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _180 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _186 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _190 = _182 * _184;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _200 = _192 * _194;
    float _202 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _204 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _206 = _198 * _188;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _210 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _202);
    float _212 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _214 = _200 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _216 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _208);
    float _218 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _210);
    float _220 = _212 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _214);
    float _224 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _216);
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _230 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _222);
    float _232 = _220 + _224;
    float _234 = _200 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _228);
    float _238 = _226 + _230;
    float _240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _242 = _232 + _240;
    float _244 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _234);
    float _246 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _236);
    float _248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _250 = _238 + _248;
    float _252 = _242 * _242;
    float _254 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _244);
    float _256 = _246 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _258 = fma(_250, _250, _252);
    float _260 = _256 + _254;
    float _262 = sqrt(_258);
    bool _264 = _262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _266 = !_264;
    float _268 = _260;
    float _270 = _238;
    float _272 = _232;
    float _274 = _254;
    float _276 = _190;
    float _278 = _256;
    if (!_266)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _262 + _282;
        float _286 = _260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_258);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = sin(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = cos(_298);
        float _302 = fma(_296, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _304 = _288 * _302;
        float _306 = _300 + (-1.0);
        float _308 = fma(_250, _304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _310 = fma(_242, _304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _312 = _306 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _314 = fma(_260, _300, _312);
        _268 = _314;
        _270 = _308;
        _272 = _310;
    }
    float _316 = _268;
    float _318 = _270;
    float _320 = _272;
    float _322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _324 = _316 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _328 = _318 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _332 = _320 + _330;
    float _334 = _324 * _324;
    float _336 = fma(_328, _328, _334);
    float _338 = fma(_332, _332, _336);
    float _340 = rsqrt(_338);
    float _342 = sqrt(_338);
    float _344 = _340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _346 = _328 * _344;
    float _348 = _332 * _344;
    float _350 = _346 * _346;
    float _352 = _348 * _348;
    float _354 = _350 + _352;
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _356 + _360;
    float _364 = _340;
    float _366 = _362;
    float _368 = _324;
    float _370 = _344;
    float _372 = _350;
    if (_358)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _364 = _374;
    }
    float _376 = _364;
    if (_358)
    {
        float _378 = rsqrt(_354);
        _274 = _378;
    }
    float _380 = _274;
    float _382 = _380;
    if (_358)
    {
        float _384 = _362 * _376;
        _366 = _384;
    }
    float _386 = _366;
    if (_358)
    {
        float _388 = _386 * 0.15915493667125701904296875;
        _276 = _388;
    }
    float _390 = _276;
    float _392 = _376;
    if (_358)
    {
        float _394 = _390 * 6.283185482025146484375;
        float _396 = sin(_394);
        _392 = _396;
    }
    float _398 = _392;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _402 = precise::max(0.0, _400);
    float _404 = _332;
    float _406 = _402;
    if (_358)
    {
        float _408 = _390 * 6.283185482025146484375;
        float _410 = cos(_408);
        _404 = _410;
    }
    float _412 = _404;
    float _414 = -_344;
    float _416 = -_402;
    float _418 = fma(_324, _414, _416);
    if (_358)
    {
        float _420 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _406 = _420;
    }
    float _422 = _406;
    float _424 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _426 = _398;
    float _428 = _422;
    if (_358)
    {
        float _430 = fma(_398, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _368 = _430;
    }
    float _432 = _368;
    float _434 = _432;
    if (!_358)
    {
        _426 = _346;
    }
    float _436 = _426;
    float _438 = _436;
    float _440 = _412;
    if (_358)
    {
        float _442 = _412 + (-1.0);
        _428 = _442;
    }
    float _444 = _428;
    float _446 = 0.0;
    if (_358)
    {
        float _448 = _380 * _432;
        _446 = _448;
    }
    float _450 = _446;
    if (!_358)
    {
        _382 = _418;
    }
    float _452 = _382;
    float _454 = _452;
    if (_358)
    {
        float _456 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _456;
    }
    float _458 = _370;
    if (_358)
    {
        float _460 = _346 * _450;
        _438 = _460;
    }
    float _462 = _438;
    if (!_358)
    {
        _434 = _348;
    }
    float _464 = _434;
    float _466 = _464;
    if (_358)
    {
        float _468 = _348 * _450;
        _466 = _468;
    }
    float _470 = _466;
    if (_358)
    {
        float _472 = fma(_418, _412, _458);
        _454 = _472;
    }
    float _474 = _454;
    if (_358)
    {
        float _476 = _462 * _462;
        _372 = _476;
    }
    float _478 = _372;
    if (!_358)
    {
        _440 = _352;
    }
    float _480 = _440;
    float _482 = _480;
    if (_358)
    {
        float _484 = _470 * _470;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_474, _474, _478);
    float _490 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _492 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _494 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _496 = _488 + _486;
    float _498 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _500 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _424);
    float _502 = floor(_494);
    float _504 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _492);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _508 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _512 = fma(_342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _510);
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _490);
    float _518 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _506);
    float _520 = _508 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _522 = rsqrt(_496);
    float _524 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _528 = _520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = _524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _536 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _504);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _528);
    float _540 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _542 = -_502;
    float _544 = _494 + _542;
    float _546 = abs(_532);
    float _548 = log2(_546);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[7].z, _538);
    float _552 = _536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _554 = _520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _556 = _522 * _462;
    float _558 = _522 * _474;
    float _560 = _522 * _470;
    float _562 = _556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _550);
    float _566 = floor(_540);
    float _568 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _554);
    float _570 = -_562;
    float _572 = fma(_558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _570);
    float _574 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _576 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _578 = -_560;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c15)._m0[21].z, _572);
    float _582 = _534 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _584 = exp2(_576);
    float _586 = fma(_580, -0.5, 0.5);
    float _588 = fma(_580, 0.5, 0.5);
    float _590 = -_582;
    float _592 = fma(_590, _574, 1.0);
    float _594 = _520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _596 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[4].z, _568);
    float _598 = fma(_588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _600 = 1.0 / _564;
    float _602 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _594);
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _596);
    float _606 = -_566;
    float _608 = _540 + _606;
    float _610 = fma(_588, _598, -0.212114393711090087890625);
    float _612 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[5].z, _602);
    float _614 = _558 + 1.0;
    float _616 = log2(_592);
    float _618 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _612);
    float _620 = -_558;
    float _622 = fma(_584, _614, _620);
    float _624 = sqrt(_586);
    float _626 = _604 * _600;
    float _628 = _618 * _600;
    float2 _2399 = float2(_544, _608);
    float _630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2399, float2(0.0), isnan(_2399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2399, float2(0.0), isnan(_2399)), level(0.0)).x;
    float _632 = fma(_588, _610, 1.570728778839111328125);
    float _634 = fma(_626, 0.5, 0.5);
    float _636 = fma(_628, -0.5, 0.5);
    float _638 = fma(_622, 0.5, 0.5);
    float _640 = _616 * 0.693147182464599609375;
    float _642 = _640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _644 = _624 * 0.636619746685028076171875;
    float3 _2430 = float3(_634, _636, _642);
    float _646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2430, float3(0.0), isnan(_2430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2430, float3(0.0), isnan(_2430)), level(0.0)).x;
    float _648 = -_632;
    float _650 = fma(_644, _648, 1.0);
    float3 _2446 = float3(_634, _636, _642);
    float4 _653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2446, float3(0.0), isnan(_2446)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2446, float3(0.0), isnan(_2446)), level(0.0)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2462 = float2(_650, _638);
    float3 _665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2462, float2(0.0), isnan(_2462)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2462, float2(0.0), isnan(_2462)), level(0.0)).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float _673 = in.m_57.x;
    float _675 = in.m_57.y;
    float _677 = _256 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _679 = in.m_57.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _683 = _681 != 0;
    float _685 = _256 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_59.w;
    float _693 = _520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _695 = in.m_61.x;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 0.0;
    bool _715 = _683;
    float _717 = _618;
    if (!_683)
    {
        float _719 = in.m_57.z;
        _713 = _719;
    }
    float _721 = _713;
    float _723 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _693);
    float _725 = 0.0;
    if (_689)
    {
        float _727 = in.m_57.x;
        _725 = _727;
    }
    float _729 = _725;
    float _731 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _733 = _675 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _735 = in.m_61.y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _679 > 0.5;
    float _741 = -_701;
    float _743 = fma(_731, 2.0, _741);
    float _745 = fma(_733, -2.0, _707);
    float _747 = 0.0;
    if (!_683)
    {
        _747 = _675;
    }
    float _749 = _747;
    out.m_63.w = _691;
    float _751 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    float _753 = _749;
    if (_683)
    {
        _753 = _673;
    }
    float _755 = _753;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _759 = in.m_65.x;
    float _761 = in.m_65.y;
    float _763 = in.m_65.z;
    float _765 = in.m_65.w;
    float _767 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _677);
    float _769 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _777 = _721;
    float _779 = _775;
    if (!_683)
    {
        _278 = _721;
    }
    float _781 = _278;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _787 = _781;
    if (_683)
    {
        _787 = _675;
    }
    float _789 = _787;
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _789;
    if (_683)
    {
        _777 = _675;
    }
    float _795 = _777;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_689)
    {
        bool _799 = _729 > 0.5;
        _715 = _799;
    }
    bool _801 = _715;
    float _803 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _805 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _811 = _675 > 0.5;
    float _813 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[78].w, _757);
    float _815 = -_735;
    float _817 = _815 + 1.0;
    out.m_67.x = _791;
    out.m_67.y = _805;
    out.m_67.z = _807;
    out.m_67.w = _797;
    float _819 = _761 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _821 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _735;
    bool _825 = _811;
    if (!_689)
    {
        _779 = _695;
    }
    float _827 = _779;
    float _829 = 1.0 / _803;
    float _831 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _819);
    float _833 = _737;
    float _835 = _831;
    float _837 = _827;
    if (_699)
    {
        float _839 = in.m_57.z;
        _833 = _839;
    }
    float _841 = _833;
    int _843 = _811 ? as_type<int>(_817) : as_type<int>(_735);
    float _845 = _821 + _803;
    float _847 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _849 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[6].z, _723);
    float _851 = _705 ? as_type<float>(_843) : _735;
    if (_711)
    {
        float _853 = _739 ? _817 : _735;
        _823 = _853;
    }
    float _855 = _823;
    float _857 = _761 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = _761 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _831);
    if (!_689)
    {
        _835 = _827;
    }
    float _863 = _835;
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _867 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _859);
    float _869 = _863;
    if (_689)
    {
        _837 = _695;
    }
    float _871 = _837;
    float _873 = _845 * _829;
    float _875 = _873 * 0.5;
    float _877 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _865);
    float _879 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _881 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _883 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _849);
    float _885 = fma(_881, _851, -0.5);
    out.m_69.x = _877;
    out.m_69.y = _879;
    out.m_69.z = _861;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
    float _891 = _871;
    float _893 = _883;
    if (_699)
    {
        bool _895 = _841 > 0.5;
        _825 = _895;
    }
    bool _897 = _825;
    float _899 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _903 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _745);
    float _905 = in.m_71.x;
    float _907 = in.m_71.y;
    float _909 = in.m_71.z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _915 = -_903;
    float _917 = fma(_899, _885, _915);
    float _919 = 1.0 / _889;
    bool _921 = _168 != 0.0;
    bool _923 = isnan(_168);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].z, _913);
    float _933 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _935 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _937 = _166 == 0.0;
    bool _939 = !_929;
    bool _941 = _937 && _939;
    out.gl_Position.x = _604;
    out.gl_Position.y = _618;
    out.gl_Position.z = _883;
    out.gl_Position.w = _564;
    float _943 = -_911;
    float _945 = fma(_933, 2.0, _943);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _901 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _951 = _170 == 0.0;
    bool _953 = _951 && _941;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    int _957 = as_type<int>(_949);
    if (_689)
    {
        float _959 = -_871;
        float _961 = _959 + 1.0;
        _955 = as_type<int>(_961);
    }
    int _963 = _955;
    float _965 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    float _967 = fma(_949, _855, -0.5);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_699)
    {
        float _971 = -_871;
        float _973 = _971 + 1.0;
        _957 = as_type<int>(_973);
    }
    int _975 = _957;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _979 = _919 * _977;
    if (_689)
    {
        float _981 = _801 ? as_type<float>(_963) : _871;
        _869 = _981;
    }
    float _983 = _869;
    float _985 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _987 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _965);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_699)
    {
        float _991 = _897 ? as_type<float>(_975) : _871;
        _891 = _991;
    }
    float _993 = _891;
    float _995 = abs(_979);
    float _997 = log2(_995);
    float _999 = _905;
    if (_953)
    {
        _793 = _907;
    }
    float _1001 = _793;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1005 = _1001;
    float _1007 = _1003;
    if (_953)
    {
        _989 = _905;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (!_953)
    {
        float _1013 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = fma(_985, -2.0, _1003);
    if (_953)
    {
        _1007 = _1009;
    }
    float _1019 = _1007;
    float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1023 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1025 = _1019;
    if (!_953)
    {
        _1011 = _905;
    }
    float _1027 = _1011;
    float _1029 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1017);
    if (_953)
    {
        _999 = _909;
    }
    float _1031 = _999;
    float _1033 = fma(_1023, _983, -0.5);
    float _1035 = -_140;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[76].x, _743);
    float _1039 = -_140;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _945);
    float _1043 = _997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1045 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1047 = _763 * _1027;
    float _1049 = _1031;
    if (!_953)
    {
        float _1051 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1027);
        _1025 = _1051;
    }
    float _1053 = _1025;
    float _1055 = exp2(_935);
    float _1057 = -_1047;
    float _1059 = fma(_759, _909, _1057);
    float _1061 = _761 * _909;
    float _1063 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1065 = _759 * _907;
    float _1067 = _1059 * _765;
    float _1069 = -_1061;
    float _1071 = fma(_763, _907, _1069);
    float _1073 = fma(_1063, _993, -0.5);
    float _1075 = exp2(_1043);
    float _1077 = -_1065;
    float _1079 = fma(_761, _1027, _1077);
    float _1081 = _1071 * _765;
    float _1083 = fma(_1045, _1073, _1041);
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _1079 * _765;
    float _1089 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_953)
    {
        float _1091 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _1049 = _1091;
    }
    float _1093 = _1049;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1097 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1101 = _979 <= 8000.0;
    bool _1103 = isnan(_979);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(8000.0);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1089);
    float _1115 = fma(_847, _1033, _1037);
    float _1117 = -_1029;
    float _1119 = fma(_987, _967, _1117);
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1127 = in.m_73.x;
    float _1129 = _1119 + 0.5;
    float _1131 = fma(_1123, -2.0, 3.0);
    float _1133 = _1123 * _1123;
    float _1135 = -_1055;
    float _1137 = _1135 + 1.0;
    bool _1139 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1141 = isnan(_342);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1147 = _1143 || _1145;
    float _1149 = _1133 * _1131;
    float _1151 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = -_1149;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1159 = _1083 + 0.5;
    float _1161 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1149);
    float _1163 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1165 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1167 = _917 + 0.5;
    float _1169 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1173 = _1111 * _1161;
    float _1175 = _1115 + 0.5;
    float _1177 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1099);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1171);
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_75.x = _1175;
    out.m_75.y = _1167;
    out.m_75.z = _1159;
    out.m_75.w = _1129;
    if (!_1147)
    {
        _893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _893;
    float _1191 = _1189;
    float _1193 = _1189;
    if (!_1147)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1195 = _717;
    out.m_77.x = _1163;
    out.m_77.y = _1165;
    out.m_77.z = _1125;
    out.m_79.x = _1181;
    out.m_79.y = _1183;
    out.m_79.z = _1185;
    float _1197 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = -_630;
    float _1201 = _1199 + 1.0;
    float _1203 = _1201 * _1187;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1205;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1211 = _1209 * _1127;
    float _1213 = _1197 * _646;
    float _1215 = -_1197;
    float _1217 = _1215 + 1.0;
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1221 = _661 * _1213;
    float _1223 = _661 * _1217;
    out.m_81.x = _1219;
    float _1225 = _671 * _1213;
    float _1227 = fma(_667, _1221, _655);
    float _1229 = fma(_669, _1221, _657);
    float _1231 = _1221;
    float _1233 = _1195;
    float _1235 = _1195;
    if (!_1147)
    {
        _1231 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1237 = _1231;
    float _1239 = fma(_661, _1225, _659);
    out.m_83.x = _1227;
    out.m_83.y = _1229;
    out.m_83.z = _1239;
    out.m_83.w = _1223;
    bool _1241 = !_1147;
    float _1243 = _1237;
    float _1245 = _1237;
    if (!_1241)
    {
        bool _1247 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1249 = isnan(_342);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1255 = _1251 || _1253;
        if (!_1255)
        {
            float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1259 = _342 + _1257;
            float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1261;
            float _1265 = 1.0 / _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1275 = _1259 * _1265;
            float _1277 = precise::clamp(_1275, 0.0, 1.0);
            float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1281 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1283 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1285 = fma(_1277, _1281, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1287 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1235 = _1287;
            _1193 = _1285;
            _1245 = _1283;
            _1289 = true;
        }
        else
        {
            bool _1291 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1293 = isnan(_342);
            bool _1295 = _1291 || _1293;
            bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1299 = _1295 || _1297;
            if (!_1299)
            {
                _1191 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1301 = _1191;
            _1193 = _1301;
            if (!_1299)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1303 = _1233;
            _1235 = _1303;
            if (!_1299)
            {
                _1243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1305 = _1243;
            bool _1307 = !_1299;
            _1245 = _1305;
            if (!_1307)
            {
                bool _1309 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1311 = isnan(_342);
                bool _1313 = _1309 || _1311;
                bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1317 = _1313 || _1315;
                if (!_1317)
                {
                    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1321 = _342 + _1319;
                    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1323;
                    float _1327 = 1.0 / _1325;
                    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1331 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1335 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1337 = _1321 * _1327;
                    float _1339 = precise::clamp(_1337, 0.0, 1.0);
                    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1343 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1345 = fma(_1339, _1335, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1347 = fma(_1339, _1343, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1349 = fma(_1339, _1331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1235 = _1349;
                    _1193 = _1347;
                    _1245 = _1345;
                    _1289 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1193 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1289 = false;
    float _1351 = _1235;
    float _1353 = _1193;
    float _1355 = _1245;
    float _1357 = _1351 * 0.586610972881317138671875;
    bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_85.x = 0.0;
    float _1361 = fma(_1353, 0.298911988735198974609375, _1357);
    float _1363 = fma(_1355, 0.114477999508380889892578125, _1361);
    out.m_49.x = 1.0;
    float _1365 = -_1363;
    float _1367 = _1365 + _1353;
    float _1369 = -_1363;
    float _1371 = _1369 + _1351;
    float _1373 = -_1363;
    float _1375 = _1373 + _1355;
    float _1377 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1381 = fma(_1371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    out.m_81.w = _1377;
    out.m_87.x = _1379;
    out.m_87.y = _1381;
    out.m_87.z = _1383;
    if (!_1359)
    {
        return out;
    }
    float _1385 = -_316;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1389 = -_318;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1393 = -_320;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = sqrt(_1401);
    float _1405 = rsqrt(_1401);
    float _1407 = -_1403;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1411 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = _1391 * _1405;
    float _1417 = _1387 * _1405;
    float _1419 = abs(_1413);
    float _1421 = log2(_1419);
    float _1423 = _1395 * _1405;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1427 = _1183 * _1417;
    float _1429 = -_1417;
    float _1431 = -_1425;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1431);
    float _1435 = fma(_1181, _1415, _1427);
    float _1437 = -_1423;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1433);
    float _1441 = fma(_1185, _1423, _1435);
    float _1443 = precise::clamp(_1441, 0.0, 1.0);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1447 = _1439 + _1445;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = exp2(_1449);
    float _1457 = _1455 * _1453;
    float _1459 = _1443 * _1457;
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1463 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1465 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1461;
    out.m_85.y = _1463;
    out.m_85.z = _1465;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1523 = as_type<float>(_122);
        out.gl_Position.z = _1523;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_136)
    {
        float _142 = float(_106);
        _114 = _142;
    }
    float _144 = _114;
    bool _146 = _140 >= _144;
    bool _148 = !_136;
    bool _150 = _146 || _148;
    float _152 = _144;
    if (_150)
    {
        _152 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _152;
    if (_150)
    {
        out.m_49.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1592 = as_type<float>(_158);
        out.gl_Position.z = _1592;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_53.x;
    float _162 = in.m_53.y;
    float _164 = in.m_53.z;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = in.m_55.z;
    float _172 = in.m_46.x;
    float _174 = in.m_46.y;
    float _176 = in.m_46.z;
    float _178 = _160 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _180 = _164 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _166);
    float _184 = _178 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _186 = _162 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _190 = _182 * _184;
    float _192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _168);
    float _194 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _196 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _170);
    float _200 = _192 * _194;
    float _202 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _204 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _196);
    float _206 = _198 * _188;
    float _208 = _200 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _210 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _202);
    float _212 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _204);
    float _214 = _200 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _216 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[10].x, _208);
    float _218 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _210);
    float _220 = _212 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _222 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[8].x, _214);
    float _224 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[10].z, _216);
    float _226 = _218 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _228 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _230 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[8].z, _222);
    float _232 = _220 + _224;
    float _234 = _200 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _236 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _228);
    float _238 = _226 + _230;
    float _240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _242 = _232 + _240;
    float _244 = fma(_190, (*spvDescriptorSet0.vp_c10)._m0[9].x, _234);
    float _246 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _236);
    float _248 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _250 = _238 + _248;
    float _252 = _242 * _242;
    float _254 = fma(_206, (*spvDescriptorSet0.vp_c10)._m0[9].z, _244);
    float _256 = _246 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _258 = fma(_250, _250, _252);
    float _260 = _256 + _254;
    float _262 = sqrt(_258);
    bool _264 = _262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _266 = !_264;
    float _268 = _260;
    float _270 = _238;
    float _272 = _232;
    float _274 = _254;
    float _276 = _190;
    float _278 = _256;
    if (!_266)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _262 + _282;
        float _286 = _260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_258);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = sin(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = cos(_298);
        float _302 = fma(_296, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _304 = _288 * _302;
        float _306 = _300 + (-1.0);
        float _308 = fma(_250, _304, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _310 = fma(_242, _304, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _312 = _306 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _314 = fma(_260, _300, _312);
        _268 = _314;
        _270 = _308;
        _272 = _310;
    }
    float _316 = _268;
    float _318 = _270;
    float _320 = _272;
    float _322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _324 = _316 + _322;
    float _326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _328 = _318 + _326;
    float _330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _332 = _320 + _330;
    float _334 = _324 * _324;
    float _336 = fma(_328, _328, _334);
    float _338 = fma(_332, _332, _336);
    float _340 = rsqrt(_338);
    float _342 = sqrt(_338);
    float _344 = _340 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _346 = _328 * _344;
    float _348 = _332 * _344;
    float _350 = _346 * _346;
    float _352 = _348 * _348;
    float _354 = _350 + _352;
    float _356 = sqrt(_354);
    bool _358 = _356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _362 = _356 + _360;
    float _364 = _340;
    float _366 = _362;
    float _368 = _324;
    float _370 = _344;
    float _372 = _350;
    if (_358)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _364 = _374;
    }
    float _376 = _364;
    if (_358)
    {
        float _378 = rsqrt(_354);
        _274 = _378;
    }
    float _380 = _274;
    float _382 = _380;
    if (_358)
    {
        float _384 = _362 * _376;
        _366 = _384;
    }
    float _386 = _366;
    if (_358)
    {
        float _388 = _386 * 0.15915493667125701904296875;
        _276 = _388;
    }
    float _390 = _276;
    float _392 = _376;
    if (_358)
    {
        float _394 = _390 * 6.283185482025146484375;
        float _396 = sin(_394);
        _392 = _396;
    }
    float _398 = _392;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _402 = precise::max(0.0, _400);
    float _404 = _332;
    float _406 = _402;
    if (_358)
    {
        float _408 = _390 * 6.283185482025146484375;
        float _410 = cos(_408);
        _404 = _410;
    }
    float _412 = _404;
    float _414 = -_344;
    float _416 = -_402;
    float _418 = fma(_324, _414, _416);
    if (_358)
    {
        float _420 = _418 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _406 = _420;
    }
    float _422 = _406;
    float _424 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _426 = _398;
    float _428 = _422;
    if (_358)
    {
        float _430 = fma(_398, _422, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _368 = _430;
    }
    float _432 = _368;
    float _434 = _432;
    if (!_358)
    {
        _426 = _346;
    }
    float _436 = _426;
    float _438 = _436;
    float _440 = _412;
    if (_358)
    {
        float _442 = _412 + (-1.0);
        _428 = _442;
    }
    float _444 = _428;
    float _446 = 0.0;
    if (_358)
    {
        float _448 = _380 * _432;
        _446 = _448;
    }
    float _450 = _446;
    if (!_358)
    {
        _382 = _418;
    }
    float _452 = _382;
    float _454 = _452;
    if (_358)
    {
        float _456 = _444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _370 = _456;
    }
    float _458 = _370;
    if (_358)
    {
        float _460 = _346 * _450;
        _438 = _460;
    }
    float _462 = _438;
    if (!_358)
    {
        _434 = _348;
    }
    float _464 = _434;
    float _466 = _464;
    if (_358)
    {
        float _468 = _348 * _450;
        _466 = _468;
    }
    float _470 = _466;
    if (_358)
    {
        float _472 = fma(_418, _412, _458);
        _454 = _472;
    }
    float _474 = _454;
    if (_358)
    {
        float _476 = _462 * _462;
        _372 = _476;
    }
    float _478 = _372;
    if (!_358)
    {
        _440 = _352;
    }
    float _480 = _440;
    float _482 = _480;
    if (_358)
    {
        float _484 = _470 * _470;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = fma(_474, _474, _478);
    float _490 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _492 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _494 = fma(_226, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _496 = _488 + _486;
    float _498 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _500 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _424);
    float _502 = floor(_494);
    float _504 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _492);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _498);
    float _508 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _500);
    float _510 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _512 = fma(_342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _510);
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _490);
    float _518 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _506);
    float _520 = _508 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _522 = rsqrt(_496);
    float _524 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _528 = _520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _530 = -_514;
    float _532 = _530 + 1.0;
    float _534 = _524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _536 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _504);
    float _538 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[7].x, _528);
    float _540 = fma(_220, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _542 = -_502;
    float _544 = _494 + _542;
    float _546 = abs(_532);
    float _548 = log2(_546);
    float _550 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[7].z, _538);
    float _552 = _536 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _554 = _520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _556 = _522 * _462;
    float _558 = _522 * _474;
    float _560 = _522 * _470;
    float _562 = _556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _564 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[7].w, _550);
    float _566 = floor(_540);
    float _568 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[4].x, _554);
    float _570 = -_562;
    float _572 = fma(_558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _570);
    float _574 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _576 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _578 = -_560;
    float _580 = fma(_578, (*spvDescriptorSet0.vp_c15)._m0[21].z, _572);
    float _582 = _534 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _584 = exp2(_576);
    float _586 = fma(_580, -0.5, 0.5);
    float _588 = fma(_580, 0.5, 0.5);
    float _590 = -_582;
    float _592 = fma(_590, _574, 1.0);
    float _594 = _520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _596 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[4].z, _568);
    float _598 = fma(_588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _600 = 1.0 / _564;
    float _602 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[5].x, _594);
    float _604 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[4].w, _596);
    float _606 = -_566;
    float _608 = _540 + _606;
    float _610 = fma(_588, _598, -0.212114393711090087890625);
    float _612 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[5].z, _602);
    float _614 = _558 + 1.0;
    float _616 = log2(_592);
    float _618 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[5].w, _612);
    float _620 = -_558;
    float _622 = fma(_584, _614, _620);
    float _624 = sqrt(_586);
    float _626 = _604 * _600;
    float _628 = _618 * _600;
    float2 _2399 = float2(_544, _608);
    float _630 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2399, float2(0.0), isnan(_2399)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2399, float2(0.0), isnan(_2399)), level(0.0)).x;
    float _632 = fma(_588, _610, 1.570728778839111328125);
    float _634 = fma(_626, 0.5, 0.5);
    float _636 = fma(_628, -0.5, 0.5);
    float _638 = fma(_622, 0.5, 0.5);
    float _640 = _616 * 0.693147182464599609375;
    float _642 = _640 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _644 = _624 * 0.636619746685028076171875;
    float3 _2430 = float3(_634, _636, _642);
    float _646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2430, float3(0.0), isnan(_2430)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2430, float3(0.0), isnan(_2430)), level(0.0)).x;
    float _648 = -_632;
    float _650 = fma(_644, _648, 1.0);
    float3 _2446 = float3(_634, _636, _642);
    float4 _653 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2446, float3(0.0), isnan(_2446)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2446, float3(0.0), isnan(_2446)), level(0.0)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float2 _2462 = float2(_650, _638);
    float3 _665 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2462, float2(0.0), isnan(_2462)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2462, float2(0.0), isnan(_2462)), level(0.0)).xyz;
    float _667 = _665.x;
    float _669 = _665.y;
    float _671 = _665.z;
    float _673 = in.m_57.x;
    float _675 = in.m_57.y;
    float _677 = _256 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _679 = in.m_57.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _683 = _681 != 0;
    float _685 = _256 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_59.w;
    float _693 = _520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _695 = in.m_61.x;
    int _697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _699 = _697 != 0;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 0.0;
    bool _715 = _683;
    float _717 = _618;
    if (!_683)
    {
        float _719 = in.m_57.z;
        _713 = _719;
    }
    float _721 = _713;
    float _723 = fma(_526, (*spvDescriptorSet0.vp_c8)._m0[6].x, _693);
    float _725 = 0.0;
    if (_689)
    {
        float _727 = in.m_57.x;
        _725 = _727;
    }
    float _729 = _725;
    float _731 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _733 = _675 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _735 = in.m_61.y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _739 = _679 > 0.5;
    float _741 = -_701;
    float _743 = fma(_731, 2.0, _741);
    float _745 = fma(_733, -2.0, _707);
    float _747 = 0.0;
    if (!_683)
    {
        _747 = _675;
    }
    float _749 = _747;
    out.m_63.w = _691;
    float _751 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].z, _737);
    float _753 = _749;
    if (_683)
    {
        _753 = _673;
    }
    float _755 = _753;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _759 = in.m_65.x;
    float _761 = in.m_65.y;
    float _763 = in.m_65.z;
    float _765 = in.m_65.w;
    float _767 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[10].x, _677);
    float _769 = fma(_226, (*spvDescriptorSet0.vp_c8)._m0[11].x, _685);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _773 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[10].z, _767);
    float _775 = fma(_220, (*spvDescriptorSet0.vp_c8)._m0[11].z, _769);
    float _777 = _721;
    float _779 = _775;
    if (!_683)
    {
        _278 = _721;
    }
    float _781 = _278;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _787 = _781;
    if (_683)
    {
        _787 = _675;
    }
    float _789 = _787;
    float _791 = _783 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _793 = _789;
    if (_683)
    {
        _777 = _675;
    }
    float _795 = _777;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_689)
    {
        bool _799 = _729 > 0.5;
        _715 = _799;
    }
    bool _801 = _715;
    float _803 = _775 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _805 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _811 = _675 > 0.5;
    float _813 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[78].w, _757);
    float _815 = -_735;
    float _817 = _815 + 1.0;
    out.m_67.x = _791;
    out.m_67.y = _805;
    out.m_67.z = _807;
    out.m_67.w = _797;
    float _819 = _761 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _821 = _773 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _823 = _735;
    bool _825 = _811;
    if (!_689)
    {
        _779 = _695;
    }
    float _827 = _779;
    float _829 = 1.0 / _803;
    float _831 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[10].x, _819);
    float _833 = _737;
    float _835 = _831;
    float _837 = _827;
    if (_699)
    {
        float _839 = in.m_57.z;
        _833 = _839;
    }
    float _841 = _833;
    int _843 = _811 ? as_type<int>(_817) : as_type<int>(_735);
    float _845 = _821 + _803;
    float _847 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _751);
    float _849 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[6].z, _723);
    float _851 = _705 ? as_type<float>(_843) : _735;
    if (_711)
    {
        float _853 = _739 ? _817 : _735;
        _823 = _853;
    }
    float _855 = _823;
    float _857 = _761 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _859 = _761 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _861 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[10].z, _831);
    if (!_689)
    {
        _835 = _827;
    }
    float _863 = _835;
    float _865 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[8].x, _857);
    float _867 = fma(_759, (*spvDescriptorSet0.vp_c10)._m0[9].x, _859);
    float _869 = _863;
    if (_689)
    {
        _837 = _695;
    }
    float _871 = _837;
    float _873 = _845 * _829;
    float _875 = _873 * 0.5;
    float _877 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[8].z, _865);
    float _879 = fma(_763, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _881 = _809 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _883 = fma(_552, (*spvDescriptorSet0.vp_c8)._m0[6].w, _849);
    float _885 = fma(_881, _851, -0.5);
    out.m_69.x = _877;
    out.m_69.y = _879;
    out.m_69.z = _861;
    float _887 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _889 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[30].w, _887);
    float _891 = _871;
    float _893 = _883;
    if (_699)
    {
        bool _895 = _841 > 0.5;
        _825 = _895;
    }
    bool _897 = _825;
    float _899 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _813);
    float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _903 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _745);
    float _905 = in.m_71.x;
    float _907 = in.m_71.y;
    float _909 = in.m_71.z;
    float _911 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _915 = -_903;
    float _917 = fma(_899, _885, _915);
    float _919 = 1.0 / _889;
    bool _921 = _168 != 0.0;
    bool _923 = isnan(_168);
    bool _925 = _921 || _923;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    float _931 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].z, _913);
    float _933 = _755 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _935 = _548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _937 = _166 == 0.0;
    bool _939 = !_929;
    bool _941 = _937 && _939;
    out.gl_Position.x = _604;
    out.gl_Position.y = _618;
    out.gl_Position.z = _883;
    out.gl_Position.w = _564;
    float _943 = -_911;
    float _945 = fma(_933, 2.0, _943);
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _949 = _901 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _951 = _170 == 0.0;
    bool _953 = _951 && _941;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    int _957 = as_type<int>(_949);
    if (_689)
    {
        float _959 = -_871;
        float _961 = _959 + 1.0;
        _955 = as_type<int>(_961);
    }
    int _963 = _955;
    float _965 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[83].w, _947);
    float _967 = fma(_949, _855, -0.5);
    float _969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_699)
    {
        float _971 = -_871;
        float _973 = _971 + 1.0;
        _957 = as_type<int>(_973);
    }
    int _975 = _957;
    float _977 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _979 = _919 * _977;
    if (_689)
    {
        float _981 = _801 ? as_type<float>(_963) : _871;
        _869 = _981;
    }
    float _983 = _869;
    float _985 = _789 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _987 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _965);
    float _989 = (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_699)
    {
        float _991 = _897 ? as_type<float>(_975) : _871;
        _891 = _991;
    }
    float _993 = _891;
    float _995 = abs(_979);
    float _997 = log2(_995);
    float _999 = _905;
    if (_953)
    {
        _793 = _907;
    }
    float _1001 = _793;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1005 = _1001;
    float _1007 = _1003;
    if (_953)
    {
        _989 = _905;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (!_953)
    {
        float _1013 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[17].y, _907);
        _1005 = _1013;
    }
    float _1015 = _1005;
    float _1017 = fma(_985, -2.0, _1003);
    if (_953)
    {
        _1007 = _1009;
    }
    float _1019 = _1007;
    float _1021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1023 = _969 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1025 = _1019;
    if (!_953)
    {
        _1011 = _905;
    }
    float _1027 = _1011;
    float _1029 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1017);
    if (_953)
    {
        _999 = _909;
    }
    float _1031 = _999;
    float _1033 = fma(_1023, _983, -0.5);
    float _1035 = -_140;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[76].x, _743);
    float _1039 = -_140;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[81].x, _945);
    float _1043 = _997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1045 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _931);
    float _1047 = _763 * _1027;
    float _1049 = _1031;
    if (!_953)
    {
        float _1051 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1027);
        _1025 = _1051;
    }
    float _1053 = _1025;
    float _1055 = exp2(_935);
    float _1057 = -_1047;
    float _1059 = fma(_759, _909, _1057);
    float _1061 = _761 * _909;
    float _1063 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1065 = _759 * _907;
    float _1067 = _1059 * _765;
    float _1069 = -_1061;
    float _1071 = fma(_763, _907, _1069);
    float _1073 = fma(_1063, _993, -0.5);
    float _1075 = exp2(_1043);
    float _1077 = -_1065;
    float _1079 = fma(_761, _1027, _1077);
    float _1081 = _1071 * _765;
    float _1083 = fma(_1045, _1073, _1041);
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1087 = _1079 * _765;
    float _1089 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    if (!_953)
    {
        float _1091 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[17].y, _909);
        _1049 = _1091;
    }
    float _1093 = _1049;
    float _1095 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1085);
    float _1097 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1101 = _979 <= 8000.0;
    bool _1103 = isnan(_979);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(8000.0);
    bool _1109 = _1105 || _1107;
    float _1111 = float(_1109);
    float _1113 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1089);
    float _1115 = fma(_847, _1033, _1037);
    float _1117 = -_1029;
    float _1119 = fma(_987, _967, _1117);
    float _1121 = fma(_1075, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1123 = precise::clamp(_1121, 0.0, 1.0);
    float _1125 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1127 = in.m_73.x;
    float _1129 = _1119 + 0.5;
    float _1131 = fma(_1123, -2.0, 3.0);
    float _1133 = _1123 * _1123;
    float _1135 = -_1055;
    float _1137 = _1135 + 1.0;
    bool _1139 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1141 = isnan(_342);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1147 = _1143 || _1145;
    float _1149 = _1133 * _1131;
    float _1151 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1153 = -_1149;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1081, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1151);
    float _1159 = _1083 + 0.5;
    float _1161 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1149);
    float _1163 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1157);
    float _1165 = fma(_1087, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1095);
    float _1167 = _917 + 0.5;
    float _1169 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1171 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1173 = _1111 * _1161;
    float _1175 = _1115 + 0.5;
    float _1177 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1169);
    float _1179 = fma(_1053, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1099);
    float _1181 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1171);
    float _1183 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1177);
    float _1185 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1179);
    float _1187 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_75.x = _1175;
    out.m_75.y = _1167;
    out.m_75.z = _1159;
    out.m_75.w = _1129;
    if (!_1147)
    {
        _893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1189 = _893;
    float _1191 = _1189;
    float _1193 = _1189;
    if (!_1147)
    {
        _717 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1195 = _717;
    out.m_77.x = _1163;
    out.m_77.y = _1165;
    out.m_77.z = _1125;
    out.m_79.x = _1181;
    out.m_79.y = _1183;
    out.m_79.z = _1185;
    float _1197 = _1137 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1199 = -_630;
    float _1201 = _1199 + 1.0;
    float _1203 = _1201 * _1187;
    float _1205 = precise::clamp(_1203, 0.0, 1.0);
    float _1207 = -_1205;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1211 = _1209 * _1127;
    float _1213 = _1197 * _646;
    float _1215 = -_1197;
    float _1217 = _1215 + 1.0;
    float _1219 = _1211 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1221 = _661 * _1213;
    float _1223 = _661 * _1217;
    out.m_81.x = _1219;
    float _1225 = _671 * _1213;
    float _1227 = fma(_667, _1221, _655);
    float _1229 = fma(_669, _1221, _657);
    float _1231 = _1221;
    float _1233 = _1195;
    float _1235 = _1195;
    if (!_1147)
    {
        _1231 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1237 = _1231;
    float _1239 = fma(_661, _1225, _659);
    out.m_83.x = _1227;
    out.m_83.y = _1229;
    out.m_83.z = _1239;
    out.m_83.w = _1223;
    bool _1241 = !_1147;
    float _1243 = _1237;
    float _1245 = _1237;
    if (!_1241)
    {
        bool _1247 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1249 = isnan(_342);
        bool _1251 = _1247 || _1249;
        bool _1253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1255 = _1251 || _1253;
        if (!_1255)
        {
            float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1259 = _342 + _1257;
            float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1261;
            float _1265 = 1.0 / _1263;
            float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1273 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1275 = _1259 * _1265;
            float _1277 = precise::clamp(_1275, 0.0, 1.0);
            float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1281 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1283 = fma(_1277, _1273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1285 = fma(_1277, _1281, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1287 = fma(_1277, _1269, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _1235 = _1287;
            _1193 = _1285;
            _1245 = _1283;
            _1289 = true;
        }
        else
        {
            bool _1291 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1293 = isnan(_342);
            bool _1295 = _1291 || _1293;
            bool _1297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1299 = _1295 || _1297;
            if (!_1299)
            {
                _1191 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1301 = _1191;
            _1193 = _1301;
            if (!_1299)
            {
                _1233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1303 = _1233;
            _1235 = _1303;
            if (!_1299)
            {
                _1243 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1305 = _1243;
            bool _1307 = !_1299;
            _1245 = _1305;
            if (!_1307)
            {
                bool _1309 = _342 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1311 = isnan(_342);
                bool _1313 = _1309 || _1311;
                bool _1315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1317 = _1313 || _1315;
                if (!_1317)
                {
                    float _1319 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1321 = _342 + _1319;
                    float _1323 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1325 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1323;
                    float _1327 = 1.0 / _1325;
                    float _1329 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1331 = _1329 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1335 = _1333 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1337 = _1321 * _1327;
                    float _1339 = precise::clamp(_1337, 0.0, 1.0);
                    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1343 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1345 = fma(_1339, _1335, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1347 = fma(_1339, _1343, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1349 = fma(_1339, _1331, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _1235 = _1349;
                    _1193 = _1347;
                    _1245 = _1345;
                    _1289 = true;
                }
                else
                {
                    _1235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1193 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1245 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _1289 = false;
    float _1351 = _1235;
    float _1353 = _1193;
    float _1355 = _1245;
    float _1357 = _1351 * 0.586610972881317138671875;
    bool _1359 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_85.x = 0.0;
    float _1361 = fma(_1353, 0.298911988735198974609375, _1357);
    float _1363 = fma(_1355, 0.114477999508380889892578125, _1361);
    out.m_49.x = 1.0;
    float _1365 = -_1363;
    float _1367 = _1365 + _1353;
    float _1369 = -_1363;
    float _1371 = _1369 + _1351;
    float _1373 = -_1363;
    float _1375 = _1373 + _1355;
    float _1377 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1379 = fma(_1367, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1381 = fma(_1371, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    float _1383 = fma(_1375, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1363);
    out.m_81.w = _1377;
    out.m_87.x = _1379;
    out.m_87.y = _1381;
    out.m_87.z = _1383;
    if (!_1359)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1385 = -_316;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1389 = -_318;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1393 = -_320;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1397 = _1387 * _1387;
    float _1399 = fma(_1391, _1391, _1397);
    float _1401 = fma(_1395, _1395, _1399);
    float _1403 = sqrt(_1401);
    float _1405 = rsqrt(_1401);
    float _1407 = -_1403;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1411 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1413 = precise::clamp(_1411, 0.0, 1.0);
    float _1415 = _1391 * _1405;
    float _1417 = _1387 * _1405;
    float _1419 = abs(_1413);
    float _1421 = log2(_1419);
    float _1423 = _1395 * _1405;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1427 = _1183 * _1417;
    float _1429 = -_1417;
    float _1431 = -_1425;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1431);
    float _1435 = fma(_1181, _1415, _1427);
    float _1437 = -_1423;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1433);
    float _1441 = fma(_1185, _1423, _1435);
    float _1443 = precise::clamp(_1441, 0.0, 1.0);
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1447 = _1439 + _1445;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1451 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = exp2(_1449);
    float _1457 = _1455 * _1453;
    float _1459 = _1443 * _1457;
    float _1461 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1463 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1465 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1461;
    out.m_85.y = _1463;
    out.m_85.z = _1465;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

