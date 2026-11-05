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
    float4 m_77 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1939 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_122);
        out.gl_Position.z = _2223;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.y;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _172 = _170 != 0;
    float _174 = in.m_53.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _164 * 2.0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _192 = _168 * 2.0;
    float _194 = floor(_186);
    float _196 = 0.0;
    float _198 = _166;
    if (!_172)
    {
        _196 = _168;
    }
    float _200 = _196;
    float _202 = _174 * 2.0;
    float _204 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _206 = floor(_192);
    float _208 = _168 + _174;
    float _210 = -_176;
    float _212 = fma(_204, 2.0, _210);
    float _214 = _208 + (-1.0);
    float _216 = floor(_202);
    bool _218 = _194 > 0.0;
    float _220 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _222 = _194 >= 0.0;
    bool _224 = isnan(_194);
    bool _226 = _222 || _224;
    bool _228 = isnan(0.0);
    bool _230 = _226 || _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _234 = _200;
    float _236 = _214;
    if (_172)
    {
        _232 = _174;
    }
    float _238 = _232;
    float _240 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _242 = _238;
    float _244 = _240;
    if (!_172)
    {
        _242 = _164;
    }
    float _246 = _242;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _250 = _206 > 0.0;
    float _252 = fma(_240, -2.0, _178);
    if (!_172)
    {
        _244 = _200;
    }
    float _254 = _244;
    bool _256 = _206 >= 0.0;
    bool _258 = isnan(_206);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = _254;
    if (_172)
    {
        _266 = _174;
    }
    float _268 = _266;
    if (_172)
    {
        _234 = _168;
    }
    float _270 = _234;
    float _272 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _248);
    bool _274 = _216 > 0.0;
    bool _276 = _216 >= 0.0;
    bool _278 = isnan(_216);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _246 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _288 = _270;
    if (!_172)
    {
        _236 = _164;
    }
    float _290 = _236;
    float _292 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _294 = _230 ? 0 : 1;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _298 = _290;
    if (_172)
    {
        _298 = _270;
    }
    float _300 = _298;
    float _302 = -_184;
    float _304 = fma(_286, 2.0, _302);
    int _306 = ~_294;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = -_182;
    float _314 = fma(_292, 2.0, _312);
    int _316 = _310;
    if (!_218)
    {
        int _318 = ~_294;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[83].w, _296);
    float _326 = in.m_49.x;
    float _328 = in.m_49.y;
    float _330 = in.m_49.z;
    bool _332 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _336 = _332 || _334;
    bool _338 = isnan(1.0);
    bool _340 = _336 || _338;
    float _342 = _284 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = _264 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _352 = ~as_type<int>(_342);
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    int _358 = _356;
    float _360 = _342;
    float _362 = _350;
    if (!_274)
    {
        int _364 = ~as_type<int>(_342);
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    if (!_172)
    {
        _360 = _164;
    }
    float _370 = _360;
    float _372 = _370;
    if (_172)
    {
        _372 = _270;
    }
    float _374 = _372;
    int _376 = ~as_type<int>(_350);
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    int _382 = _380;
    if (!_172)
    {
        _288 = _174;
    }
    float _384 = _288;
    float _386 = _374 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _388 = _384;
    if (!_250)
    {
        int _390 = ~as_type<int>(_350);
        int _392 = _390 + 1;
        _382 = _392;
    }
    int _394 = _382;
    if (!_340)
    {
        float _396 = _166 * _166;
        float _398 = _396 * 0.5;
        _362 = _398;
    }
    float _400 = _362;
    float _402 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_340)
    {
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _404;
    }
    float _406 = _388;
    bool _408 = !_340;
    float _410 = _406;
    if (!_408)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = _166 * _414;
        float _424 = 1.0 / _418;
        float _426 = _420 * 0.693147182464599609375;
        float _428 = exp2(_422);
        float _430 = 1.0 / _426;
        float _432 = _428 + (-1.0);
        float _434 = -_432;
        float _436 = fma(_434, _430, _166);
        float _438 = _436 * _424;
        float _440 = _438 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _440;
    }
    float _442 = _410;
    bool _444 = !_340;
    if (!_444)
    {
        float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = log2(_446);
        float _450 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _452 = _450 + 1.0;
        float _454 = 1.0 / _452;
        float _456 = _166 * _448;
        float _458 = exp2(_456);
        float _460 = -_458;
        float _462 = _460 + 1.0;
        float _464 = _462 * _454;
        _198 = _464;
    }
    float _466 = _198;
    float _468 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _470 = log2(_468);
    float _472 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _476 = fma(_402, -2.0, _188);
    float _478 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = fma(_466, _328, _472);
    float _482 = fma(_466, _326, _474);
    float _484 = fma(_386, -2.0, _190);
    float _486 = fma(_480, _180, _346);
    float _488 = fma(_482, _180, _344);
    float _490 = fma(_466, _330, _478);
    float _492 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    float _506 = _470 * _134;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _514 = fma(_490, _180, _348);
    float _516 = exp2(_506);
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _512);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = 1.0 / _510;
    bool _540 = !_496;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _484);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _526);
    bool _562 = !_500;
    int _564 = _562 ? 0 : 1;
    float _566 = -_516;
    float _568 = _566 + 1.0;
    int _570 = abs(_542);
    float _572 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _544);
    float _574 = float(_322);
    float _576 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _556);
    float _578 = _554 ? _568 : 0.0;
    float _580 = _486 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _272);
    float _584 = float(_570);
    float _586 = -_134;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[86].x, _304);
    float _590 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _560);
    float _592 = -_134;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _314);
    int _596 = abs(_564);
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _600 = -_134;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _604 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _606 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _576);
    float _608 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _324);
    float _610 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _476);
    float _612 = _486 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    int _616 = as_type<int>(_492);
    float _618 = _604;
    if (_536)
    {
        float _620 = _578 * _538;
        _156 = _620;
    }
    float _622 = _156;
    float _624 = _486 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = _584 * _574;
    float _628 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _630 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _632 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (-2.0);
    float _636 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = float(_368);
    float _642 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _644 = float(_596);
    float _646 = fma(_634, _518, _518);
    float _648 = _174 + (-0.5);
    float _650 = fma(_220, _634, _220);
    float _652 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _638 + _654;
    float _658 = _644 * _640;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _652 + _664;
    float _668 = _656 * _656;
    bool _670 = !_504;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_650, _622, _660);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _662 + _676;
    float _680 = fma(_666, _666, _668);
    int _682 = abs(_672);
    float _684 = _168 + _164;
    float _686 = fma(_678, _678, _680);
    float _688 = float(_394);
    float _690 = _684 + (-1.0);
    float _692 = float(_682);
    float _694 = rsqrt(_686);
    float _696 = _658 * (-2.0);
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _700 = _168 + (-0.5);
    float _702 = _692 * _688;
    float _704 = fma(_696, _520, _520);
    float _706 = _174 + _164;
    float _708 = fma(_698, _696, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].y, _704);
    float _712 = _706 + (-1.0);
    float _714 = _702 * (-2.0);
    float _716 = _674 * 0.15915493667125701904296875;
    float _718 = fma(_708, _622, _710);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_714, _522, _522);
    float _724 = _164 + (-0.5);
    float _726 = _656 * _694;
    float _728 = fma(_720, _714, _720);
    float _730 = _666 * _694;
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = -_726;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _738 = _718 * 0.15915493667125701904296875;
    float _740 = -_730;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _744 = fma(_728, _622, _732);
    float _746 = _736 * _736;
    float _748 = _678 * _694;
    float _750 = in.m_55.x;
    float _752 = in.m_55.y;
    float _754 = in.m_55.z;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _744 * 0.15915493667125701904296875;
    float _762 = -_748;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _766 = _716 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = _738 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_742, _742, _746);
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = fma(_764, _764, _774);
    float _784 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _738 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _750 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = sqrt(_782);
    float _802 = _768 * _772;
    float _804 = _758 * _772;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _768 * _788;
    float _812 = _758 * _788;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _816 = _760 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _694 * _800;
    float _822 = _820 * _794;
    float _824 = _820 * _796;
    float _826 = _820 * _798;
    float _828 = _768 * _808;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _832 = _814 * _822;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _836 = _788 * _808;
    float _838 = _830 * _824;
    float _840 = _828 * _832;
    float _842 = _834 * _826;
    float _844 = fma(_818, _810, _804);
    float _846 = _758 * _808;
    float _848 = -_812;
    float _850 = fma(_818, _802, _848);
    float _852 = -_832;
    float _854 = _818 * _852;
    float _856 = fma(_844, _838, _840);
    float _858 = _772 * _808;
    float _860 = -_802;
    float _862 = fma(_818, _812, _860);
    float _864 = _846 * _832;
    float _866 = fma(_836, _838, _854);
    float _868 = -_842;
    float _870 = fma(_850, _868, _856);
    float _872 = fma(_818, _804, _810);
    float _874 = fma(_862, _838, _864);
    float _876 = -_842;
    float _878 = fma(_858, _876, _866);
    float _880 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _884 = -_842;
    float _886 = fma(_872, _884, _874);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _890);
    float _896 = _662 + _892;
    float _898 = _652 + _894;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _896 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _906 = _898 + _904;
    float _908 = _902 * _902;
    float _910 = fma(_906, _906, _908);
    float _912 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = sqrt(_910);
    float _916 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _918 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _920 = _638 + _918;
    bool _922 = _914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _898;
    float _928 = _878;
    float _930 = _730;
    float _932 = _838;
    float _934 = _726;
    if (!_922)
    {
        _924 = _898;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_922)
    {
        _926 = _896;
    }
    float _940 = _926;
    float _942 = _940;
    if (!_922)
    {
        _928 = _920;
    }
    float _944 = _928;
    bool _946 = !_922;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _914 + _952;
        float _956 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_910);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_920, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_906, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _938 = _982;
        _942 = _984;
    }
    float _986 = _948;
    float _988 = _938;
    float _990 = _942;
    float _992 = -_726;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _996 = -_730;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1000 = -_748;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = fma(_1010, _1010, _1016);
    float _1020 = fma(_1014, _1014, _1018);
    float _1022 = rsqrt(_1020);
    float _1024 = sqrt(_1020);
    float _1026 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1028 = _1010 * _1026;
    float _1030 = _1014 * _1026;
    float _1032 = _1028 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 + _1034;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = _1038 + _1042;
    float _1046 = _1014;
    float _1048 = _1036;
    float _1050 = _1044;
    float _1052 = _1006;
    if (_1040)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1054;
    }
    float _1056 = _1046;
    if (_1040)
    {
        float _1058 = rsqrt(_1036);
        _1048 = _1058;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_1040)
    {
        float _1064 = _1044 * _1056;
        _1050 = _1064;
    }
    float _1066 = _1050;
    if (_1040)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _930 = _1068;
    }
    float _1070 = _930;
    float _1072 = _1056;
    if (_1040)
    {
        float _1074 = _1070 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1082 = precise::max(0.0, _1080);
    float _1084 = _1016;
    float _1086 = _1082;
    if (_1040)
    {
        float _1088 = _1070 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        _1084 = _1090;
    }
    float _1092 = _1084;
    float _1094 = -_1026;
    float _1096 = -_1082;
    float _1098 = fma(_1006, _1094, _1096);
    if (!_1040)
    {
        _1052 = _1028;
    }
    float _1100 = _1052;
    float _1102 = _1100;
    if (_1040)
    {
        float _1104 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1104;
    }
    float _1106 = _1086;
    float _1108 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1110 = _1078;
    float _1112 = _1106;
    if (_1040)
    {
        float _1114 = fma(_1078, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1110 = _1114;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    float _1120 = _1092;
    if (_1040)
    {
        float _1122 = _1092 + (-1.0);
        _1112 = _1122;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (_1040)
    {
        float _1128 = _1060 * _1116;
        _932 = _1128;
    }
    float _1130 = _932;
    if (!_1040)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1040)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _1136;
    }
    float _1138 = _934;
    if (_1040)
    {
        float _1140 = _1028 * _1130;
        _1102 = _1140;
    }
    float _1142 = _1102;
    if (!_1040)
    {
        _1126 = _1030;
    }
    float _1144 = _1126;
    float _1146 = _1144;
    if (_1040)
    {
        float _1148 = _1030 * _1130;
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1040)
    {
        _1062 = _1032;
    }
    float _1152 = _1062;
    float _1154 = _1152;
    if (_1040)
    {
        float _1156 = fma(_1098, _1092, _1138);
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (_1040)
    {
        float _1160 = _1142 * _1142;
        _1154 = _1160;
    }
    float _1162 = _1154;
    if (!_1040)
    {
        _1120 = _1034;
    }
    float _1164 = _1120;
    float _1166 = _1164;
    if (_1040)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1158, _1158, _1162);
    float _1174 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1176 = _1172 + _1170;
    float _1178 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1108);
    float _1180 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = rsqrt(_1176);
    float _1190 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1192 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1194 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1196 = -_1186;
    float _1198 = _1196 + 1.0;
    float _1200 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1192);
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1194);
    float _1206 = abs(_1198);
    float _1208 = log2(_1206);
    float _1210 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1216 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1218 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = _1188 * _1142;
    float _1226 = _1188 * _1158;
    float _1228 = _1188 * _1150;
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = -_1232;
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = -_1234;
    float _1246 = fma(_1244, _1174, 1.0);
    float _1248 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = -_1228;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1256 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = log2(_1246);
    float _1262 = fma(_1254, -0.5, 0.5);
    float _1264 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = fma(_1254, 0.5, 0.5);
    float _1270 = _1226 + 1.0;
    float _1272 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1276 = 1.0 / _1250;
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1280 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1274);
    float _1282 = exp2(_1248);
    float _1284 = _1260 * 0.693147182464599609375;
    float _1286 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1288 = sqrt(_1262);
    float _1290 = fma(_1268, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = _1278 * _1276;
    float _1294 = _1280 * _1276;
    float _1296 = fma(_1268, _1290, -0.212114393711090087890625);
    float _1298 = fma(_1292, 0.5, 0.5);
    float _1300 = fma(_1294, -0.5, 0.5);
    float _1302 = -_1226;
    float _1304 = fma(_1282, _1270, _1302);
    float _1306 = fma(_1268, _1296, 1.570728778839111328125);
    float _1308 = fma(_1304, 0.5, 0.5);
    float _1310 = _1288 * 0.636619746685028076171875;
    float3 _4150 = float3(_1298, _1300, _1286);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float _1314 = -_1306;
    float _1316 = fma(_1310, _1314, 1.0);
    float3 _4166 = float3(_1298, _1300, _1286);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4166, float3(0.0), isnan(_4166)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4166, float3(0.0), isnan(_4166)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _4183 = float2(_1316, _1308);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4183, float2(0.0), isnan(_4183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4183, float2(0.0), isnan(_4183)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = in.m_61.y;
    bool _1341 = _164 > 0.5;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = in.m_53.w;
    bool _1347 = _168 > 0.5;
    float _1349 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1353 = _1351 != 0;
    float _1355 = in.m_61.x;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    out.m_63.x = _998;
    out.m_63.y = _994;
    out.m_63.z = _1002;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1369 = _1367 != 0;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1373 = -_1339;
    float _1375 = _1373 + 1.0;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1381 = _1345 > 0.5;
    int _1383 = _1347 ? as_type<int>(_1375) : as_type<int>(_1339);
    int _1385 = _1381 ? as_type<int>(_1375) : as_type<int>(_1339);
    float _1387 = _1359 ? as_type<float>(_1383) : _1339;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    float _1399 = fma(_1379, _1387, -0.5);
    float _1401 = in.m_65.x;
    float _1403 = in.m_65.y;
    float _1405 = in.m_65.z;
    float _1407 = _1393 ? as_type<float>(_1385) : _1339;
    float _1409 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1411 = _1339;
    bool _1413 = _1393;
    int _1415 = as_type<int>(_1399);
    float _1417 = _1361;
    float _1419 = _1343;
    float _1421 = _1280;
    float _1423 = _1278;
    if (_1353)
    {
        float _1425 = _1341 ? _1375 : _1339;
        _1411 = _1425;
    }
    float _1427 = _1411;
    float _1429 = exp2(_1349);
    bool _1431 = _778 != 0.0;
    bool _1433 = isnan(_778);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    if (_1365)
    {
        bool _1441 = _174 > 0.5;
        _1413 = _1441;
    }
    bool _1443 = _1413;
    float _1445 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1447 = _776 == 0.0;
    bool _1449 = !_1439;
    bool _1451 = _1447 && _1449;
    float _1453 = -_492;
    float _1455 = fma(_604, _1399, _1453);
    int _1457 = as_type<int>(_1445);
    float _1459 = _1355;
    if (_1397)
    {
        float _1461 = -_1355;
        float _1463 = _1461 + 1.0;
        _616 = as_type<int>(_1463);
    }
    int _1465 = _616;
    float _1467 = fma(_1407, _1445, -0.5);
    bool _1469 = _780 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = as_type<float>(_1465);
    if (_1365)
    {
        float _1475 = -_1355;
        float _1477 = _1475 + 1.0;
        _1415 = as_type<int>(_1477);
    }
    int _1479 = _1415;
    if (_1369)
    {
        float _1481 = -_1355;
        float _1483 = _1481 + 1.0;
        _1457 = as_type<int>(_1483);
    }
    int _1485 = _1457;
    if (!_1397)
    {
        _1417 = _1355;
    }
    float _1487 = _1417;
    float _1489 = fma(_1409, _1427, -0.5);
    float _1491 = 0.0;
    float _1493 = _1487;
    if (!_1365)
    {
        _1491 = _1355;
    }
    float _1495 = _1491;
    float _1497 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = 0.0;
    float _1501 = _1495;
    if (!_1369)
    {
        _1499 = _1355;
    }
    float _1503 = _1499;
    float _1505 = -_1429;
    float _1507 = _1505 + 1.0;
    float _1509 = _1503;
    if (_1397)
    {
        float _1511 = _1347 ? as_type<float>(_1465) : _1355;
        _1493 = _1511;
    }
    float _1513 = _1493;
    if (_1365)
    {
        float _1515 = _1443 ? as_type<float>(_1479) : _1355;
        _1501 = _1515;
    }
    float _1517 = _1501;
    float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = 0.0;
    if (_1471)
    {
        _1521 = _1401;
    }
    float _1523 = _1521;
    float _1525 = _1523;
    if (_1369)
    {
        float _1527 = _1341 ? as_type<float>(_1485) : _1355;
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1471)
    {
        _1473 = _1523;
    }
    float _1531 = _1473;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    float _1539 = in.m_67.w;
    float _1541 = _1531;
    if (!_1471)
    {
        _1525 = _1401;
    }
    float _1543 = _1525;
    float _1545 = fma(_1497, _1529, -0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1549 = 0.0;
    if (_1471)
    {
        _1549 = _1403;
    }
    float _1551 = _1549;
    float _1553 = _1551;
    if (_1471)
    {
        _1459 = _1405;
    }
    float _1555 = _1459;
    float _1557 = fma(_582, _1545, _594);
    float _1559 = _1555;
    if (_1471)
    {
        _618 = _1551;
    }
    float _1561 = _618;
    float _1563 = _1561;
    if (!_1471)
    {
        float _1565 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1543);
        _1541 = _1565;
    }
    float _1567 = _1541;
    if (_1471)
    {
        _1419 = _1555;
    }
    float _1569 = _1419;
    float _1571 = _1569;
    if (!_1471)
    {
        _1553 = _1403;
    }
    float _1573 = _1553;
    float _1575 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1471)
    {
        _1559 = _1405;
    }
    float _1577 = _1559;
    float _1579 = fma(_1575, _1517, -0.5);
    float _1581 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1471)
    {
        float _1583 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1563 = _1583;
    }
    float _1585 = _1563;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1471)
    {
        float _1589 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1571 = _1589;
    }
    float _1591 = _1571;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1597 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1581, _1513, -0.5);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1537 * _1543;
    float _1607 = _1535 * _1577;
    float _1609 = _1533 * _1573;
    float _1611 = fma(_590, _1599, _588);
    out.m_69.x = _1597;
    out.m_69.y = _1601;
    out.m_69.z = _1603;
    float _1613 = fma(_598, _1579, _602);
    float _1615 = -_1605;
    float _1617 = fma(_1533, _1577, _1615);
    float _1619 = -_1607;
    float _1621 = fma(_1537, _1573, _1619);
    float _1623 = -_1609;
    float _1625 = fma(_1535, _1543, _1623);
    float _1627 = -_558;
    float _1629 = fma(_608, _1467, _1627);
    float _1631 = _1617 * _1539;
    float _1633 = _1455 + 0.5;
    float _1635 = _1613 + 0.5;
    float _1637 = _1557 + 0.5;
    float _1639 = _1629 + 0.5;
    float _1641 = _1621 * _1539;
    float _1643 = _1611 + 0.5;
    float _1645 = -_610;
    float _1647 = fma(_606, _1489, _1645);
    float _1649 = -_1591;
    float _1651 = _818 * _1649;
    float _1653 = -_1537;
    float _1655 = _818 * _1653;
    float _1657 = _1625 * _1539;
    out.m_71.x = _1635;
    out.m_71.y = _1633;
    out.m_71.z = _1637;
    out.m_71.w = _1639;
    float _1659 = fma(_836, _1567, _1651);
    float _1661 = fma(_836, _1533, _1655);
    float _1663 = _828 * _1591;
    float _1665 = _828 * _1537;
    float _1667 = -_1657;
    float _1669 = _818 * _1667;
    float _1671 = _828 * _1657;
    float _1673 = _846 * _1657;
    float _1675 = _1647 + 0.5;
    float _1677 = fma(_836, _1641, _1669);
    float _1679 = _846 * _1537;
    float _1681 = fma(_862, _1641, _1673);
    float _1683 = _846 * _1591;
    out.m_73.x = _1643;
    out.m_73.y = _1675;
    float _1685 = fma(_844, _1567, _1663);
    float _1687 = fma(_844, _1533, _1665);
    float _1689 = fma(_844, _1641, _1671);
    float _1691 = fma(_862, _1533, _1679);
    float _1693 = -_1585;
    float _1695 = fma(_850, _1693, _1685);
    float _1697 = -_1535;
    float _1699 = fma(_850, _1697, _1687);
    float _1701 = -_1535;
    float _1703 = fma(_858, _1701, _1661);
    float _1705 = -_1631;
    float _1707 = fma(_858, _1705, _1677);
    float _1709 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = -_1631;
    float _1717 = fma(_850, _1715, _1689);
    float _1719 = -_1631;
    float _1721 = fma(_872, _1719, _1681);
    float _1723 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1729 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1731 = fma(_862, _1567, _1683);
    float _1733 = -_1585;
    float _1735 = fma(_858, _1733, _1659);
    float _1737 = -_1535;
    float _1739 = fma(_872, _1737, _1691);
    float _1741 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1743 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1725);
    float _1745 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1727);
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1729);
    float _1749 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1751 = -_1585;
    float _1753 = fma(_872, _1751, _1731);
    float _1755 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1709);
    float _1757 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1759 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1763 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1741);
    float _1765 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1749);
    float _1767 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1745);
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1747);
    float _1771 = _1250 * 0.5;
    float _1773 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1777 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1779 = fma(_1280, -0.5, _1771);
    float _1781 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1757);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1755);
    float _1787 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1789 = _1773 + _1250;
    float _1791 = _1278 + _1250;
    float _1793 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1795 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1783);
    float _1797 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1777);
    float _1799 = _1789 * 0.5;
    float _1801 = _1791 * 0.5;
    float _1803 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1787);
    out.m_75.x = _1793;
    out.m_75.y = _1775;
    out.m_75.z = _1795;
    bool _1805 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1024);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    out.m_77.x = _1801;
    out.m_77.y = _1779;
    out.m_77.z = _1799;
    out.m_77.w = _1250;
    out.m_79.x = _1785;
    out.m_79.y = _1797;
    out.m_79.z = _1803;
    out.m_81.x = _1763;
    out.m_81.y = _1767;
    out.m_81.z = _1769;
    out.gl_Position.x = _1278;
    out.gl_Position.y = _1280;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1250;
    float _1815 = _1769;
    float _1817 = _1767;
    float _1819 = _1763;
    if (!_1813)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1821 = _1815;
    float _1823 = _1821;
    float _1825 = _1821;
    if (!_1813)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1827;
    if (!_1813)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1813)
    {
        _1421 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1839 = _1421;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1813)
    {
        _1423 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1845 = _1423;
    float _1847 = _1519 * _1312;
    float _1849 = -_1519;
    float _1851 = _1849 + 1.0;
    float _1853 = _1327 * _1847;
    float _1855 = _1327 * _1851;
    float _1857 = _1337 * _1847;
    float _1859 = fma(_1333, _1853, _1321);
    float _1861 = fma(_1335, _1853, _1323);
    float _1863 = _1853;
    float _1865 = _1845;
    float _1867 = _1845;
    if (!_1813)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1863;
    float _1871 = fma(_1327, _1857, _1325);
    out.m_83.x = _1859;
    out.m_83.y = _1861;
    out.m_83.z = _1871;
    out.m_83.w = _1855;
    bool _1873 = !_1813;
    float _1875 = _1869;
    float _1877 = _1869;
    if (!_1873)
    {
        bool _1879 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1881 = isnan(_1024);
        bool _1883 = _1879 || _1881;
        bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1887 = _1883 || _1885;
        if (!_1887)
        {
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1891 = _1024 + _1889;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1893;
            float _1897 = 1.0 / _1895;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1919 = _1891 * _1897;
            float _1921 = precise::clamp(_1919, 0.0, 1.0);
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = fma(_1921, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1921, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1931 = fma(_1921, _1901, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1933 = fma(_1921, _1909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1935 = fma(_1921, _1913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1937 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1831 = _1931;
            _1867 = _1935;
            _1825 = _1929;
            _1843 = _1933;
            _1837 = _1927;
            _1877 = _1937;
            _1939 = true;
        }
        else
        {
            bool _1941 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1943 = isnan(_1024);
            bool _1945 = _1941 || _1943;
            bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1949 = _1945 || _1947;
            if (!_1949)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1951 = _1841;
            _1843 = _1951;
            if (!_1949)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1953 = _1865;
            _1867 = _1953;
            if (!_1949)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1955 = _1875;
            _1877 = _1955;
            if (!_1949)
            {
                _1823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1957 = _1823;
            _1825 = _1957;
            if (!_1949)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1959 = _1829;
            _1831 = _1959;
            if (!_1949)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1961 = _1835;
            bool _1963 = !_1949;
            _1837 = _1961;
            if (!_1963)
            {
                bool _1965 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1967 = isnan(_1024);
                bool _1969 = _1965 || _1967;
                bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1973 = _1969 || _1971;
                if (!_1973)
                {
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1977 = _1024 + _1975;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1979;
                    float _1983 = 1.0 / _1981;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2005 = _1977 * _1983;
                    float _2007 = precise::clamp(_2005, 0.0, 1.0);
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = fma(_2007, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2007, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2017 = fma(_2007, _1987, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2019 = fma(_2007, _1995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2021 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2023 = fma(_2007, _2003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1831 = _2017;
                    _1867 = _2021;
                    _1825 = _2015;
                    _1843 = _2019;
                    _1837 = _2013;
                    _1877 = _2023;
                    _1939 = true;
                }
                else
                {
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1939 = false;
    float _2025 = _1831;
    float _2027 = _1867;
    float _2029 = _1825;
    float _2031 = _1843;
    float _2033 = _1837;
    float _2035 = _1877;
    float _2037 = fma(_1797, -0.5, 0.5);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = -_2025;
    float _2043 = _2027 + _2041;
    float _2045 = -_2029;
    float _2047 = _2031 + _2045;
    float _2049 = -_2033;
    float _2051 = _2035 + _2049;
    bool _2053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2055 = fma(_2039, _2043, _2025);
    float _2057 = fma(_2039, _2047, _2029);
    float _2059 = fma(_2039, _2051, _2033);
    float _2061 = _2055 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2063 = fma(_2057, 0.298911988735198974609375, _2061);
    float _2065 = fma(_2059, 0.114477999508380889892578125, _2063);
    out.m_85.x = 0.0;
    float _2067 = -_2065;
    float _2069 = _2057 + _2067;
    float _2071 = -_2065;
    float _2073 = _2055 + _2071;
    float _2075 = -_2065;
    float _2077 = _2059 + _2075;
    float _2079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2085 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_87.w = _2079;
    out.m_89.x = _2081;
    out.m_89.y = _2083;
    out.m_89.z = _2085;
    if (!_2053)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2087 = -_994;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2091 = -_998;
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2095 = -_1002;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = sqrt(_2103);
    float _2107 = rsqrt(_2103);
    float _2109 = -_2105;
    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2113 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2115 = precise::clamp(_2113, 0.0, 1.0);
    float _2117 = _2093 * _2107;
    float _2119 = _2089 * _2107;
    float _2121 = abs(_2115);
    float _2123 = log2(_2121);
    float _2125 = _2097 * _2107;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2129 = _1797 * _2119;
    float _2131 = -_2119;
    float _2133 = -_2127;
    float _2135 = fma(_2131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2133);
    float _2137 = fma(_1785, _2117, _2129);
    float _2139 = -_2125;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2135);
    float _2143 = fma(_1803, _2125, _2137);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2149 = _2141 + _2147;
    float _2151 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = exp2(_2151);
    float _2159 = _2157 * _2155;
    float _2161 = _2145 * _2159;
    float _2163 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2165 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2163;
    out.m_85.y = _2165;
    out.m_85.z = _2167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1939 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_122);
        out.gl_Position.z = _2223;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_152)
    {
        return out;
    }
    float _164 = in.m_53.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.y;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _172 = _170 != 0;
    float _174 = in.m_53.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _164 * 2.0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _192 = _168 * 2.0;
    float _194 = floor(_186);
    float _196 = 0.0;
    float _198 = _166;
    if (!_172)
    {
        _196 = _168;
    }
    float _200 = _196;
    float _202 = _174 * 2.0;
    float _204 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _206 = floor(_192);
    float _208 = _168 + _174;
    float _210 = -_176;
    float _212 = fma(_204, 2.0, _210);
    float _214 = _208 + (-1.0);
    float _216 = floor(_202);
    bool _218 = _194 > 0.0;
    float _220 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _222 = _194 >= 0.0;
    bool _224 = isnan(_194);
    bool _226 = _222 || _224;
    bool _228 = isnan(0.0);
    bool _230 = _226 || _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _234 = _200;
    float _236 = _214;
    if (_172)
    {
        _232 = _174;
    }
    float _238 = _232;
    float _240 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _242 = _238;
    float _244 = _240;
    if (!_172)
    {
        _242 = _164;
    }
    float _246 = _242;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _250 = _206 > 0.0;
    float _252 = fma(_240, -2.0, _178);
    if (!_172)
    {
        _244 = _200;
    }
    float _254 = _244;
    bool _256 = _206 >= 0.0;
    bool _258 = isnan(_206);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = _254;
    if (_172)
    {
        _266 = _174;
    }
    float _268 = _266;
    if (_172)
    {
        _234 = _168;
    }
    float _270 = _234;
    float _272 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _248);
    bool _274 = _216 > 0.0;
    bool _276 = _216 >= 0.0;
    bool _278 = isnan(_216);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _246 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _288 = _270;
    if (!_172)
    {
        _236 = _164;
    }
    float _290 = _236;
    float _292 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _294 = _230 ? 0 : 1;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _298 = _290;
    if (_172)
    {
        _298 = _270;
    }
    float _300 = _298;
    float _302 = -_184;
    float _304 = fma(_286, 2.0, _302);
    int _306 = ~_294;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = -_182;
    float _314 = fma(_292, 2.0, _312);
    int _316 = _310;
    if (!_218)
    {
        int _318 = ~_294;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[83].w, _296);
    float _326 = in.m_49.x;
    float _328 = in.m_49.y;
    float _330 = in.m_49.z;
    bool _332 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _336 = _332 || _334;
    bool _338 = isnan(1.0);
    bool _340 = _336 || _338;
    float _342 = _284 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = _264 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _352 = ~as_type<int>(_342);
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    int _358 = _356;
    float _360 = _342;
    float _362 = _350;
    if (!_274)
    {
        int _364 = ~as_type<int>(_342);
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    if (!_172)
    {
        _360 = _164;
    }
    float _370 = _360;
    float _372 = _370;
    if (_172)
    {
        _372 = _270;
    }
    float _374 = _372;
    int _376 = ~as_type<int>(_350);
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    int _382 = _380;
    if (!_172)
    {
        _288 = _174;
    }
    float _384 = _288;
    float _386 = _374 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _388 = _384;
    if (!_250)
    {
        int _390 = ~as_type<int>(_350);
        int _392 = _390 + 1;
        _382 = _392;
    }
    int _394 = _382;
    if (!_340)
    {
        float _396 = _166 * _166;
        float _398 = _396 * 0.5;
        _362 = _398;
    }
    float _400 = _362;
    float _402 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_340)
    {
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _404;
    }
    float _406 = _388;
    bool _408 = !_340;
    float _410 = _406;
    if (!_408)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = _166 * _414;
        float _424 = 1.0 / _418;
        float _426 = _420 * 0.693147182464599609375;
        float _428 = exp2(_422);
        float _430 = 1.0 / _426;
        float _432 = _428 + (-1.0);
        float _434 = -_432;
        float _436 = fma(_434, _430, _166);
        float _438 = _436 * _424;
        float _440 = _438 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _440;
    }
    float _442 = _410;
    bool _444 = !_340;
    if (!_444)
    {
        float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = log2(_446);
        float _450 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _452 = _450 + 1.0;
        float _454 = 1.0 / _452;
        float _456 = _166 * _448;
        float _458 = exp2(_456);
        float _460 = -_458;
        float _462 = _460 + 1.0;
        float _464 = _462 * _454;
        _198 = _464;
    }
    float _466 = _198;
    float _468 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _470 = log2(_468);
    float _472 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _476 = fma(_402, -2.0, _188);
    float _478 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = fma(_466, _328, _472);
    float _482 = fma(_466, _326, _474);
    float _484 = fma(_386, -2.0, _190);
    float _486 = fma(_480, _180, _346);
    float _488 = fma(_482, _180, _344);
    float _490 = fma(_466, _330, _478);
    float _492 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    float _506 = _470 * _134;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _514 = fma(_490, _180, _348);
    float _516 = exp2(_506);
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _512);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = 1.0 / _510;
    bool _540 = !_496;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _484);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _526);
    bool _562 = !_500;
    int _564 = _562 ? 0 : 1;
    float _566 = -_516;
    float _568 = _566 + 1.0;
    int _570 = abs(_542);
    float _572 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _544);
    float _574 = float(_322);
    float _576 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _556);
    float _578 = _554 ? _568 : 0.0;
    float _580 = _486 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _272);
    float _584 = float(_570);
    float _586 = -_134;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[86].x, _304);
    float _590 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _560);
    float _592 = -_134;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _314);
    int _596 = abs(_564);
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _600 = -_134;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _604 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _606 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _576);
    float _608 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _324);
    float _610 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _476);
    float _612 = _486 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    int _616 = as_type<int>(_492);
    float _618 = _604;
    if (_536)
    {
        float _620 = _578 * _538;
        _156 = _620;
    }
    float _622 = _156;
    float _624 = _486 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = _584 * _574;
    float _628 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _630 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _632 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (-2.0);
    float _636 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = float(_368);
    float _642 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _644 = float(_596);
    float _646 = fma(_634, _518, _518);
    float _648 = _174 + (-0.5);
    float _650 = fma(_220, _634, _220);
    float _652 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _638 + _654;
    float _658 = _644 * _640;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _652 + _664;
    float _668 = _656 * _656;
    bool _670 = !_504;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_650, _622, _660);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _662 + _676;
    float _680 = fma(_666, _666, _668);
    int _682 = abs(_672);
    float _684 = _168 + _164;
    float _686 = fma(_678, _678, _680);
    float _688 = float(_394);
    float _690 = _684 + (-1.0);
    float _692 = float(_682);
    float _694 = rsqrt(_686);
    float _696 = _658 * (-2.0);
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _700 = _168 + (-0.5);
    float _702 = _692 * _688;
    float _704 = fma(_696, _520, _520);
    float _706 = _174 + _164;
    float _708 = fma(_698, _696, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].y, _704);
    float _712 = _706 + (-1.0);
    float _714 = _702 * (-2.0);
    float _716 = _674 * 0.15915493667125701904296875;
    float _718 = fma(_708, _622, _710);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_714, _522, _522);
    float _724 = _164 + (-0.5);
    float _726 = _656 * _694;
    float _728 = fma(_720, _714, _720);
    float _730 = _666 * _694;
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = -_726;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _738 = _718 * 0.15915493667125701904296875;
    float _740 = -_730;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _744 = fma(_728, _622, _732);
    float _746 = _736 * _736;
    float _748 = _678 * _694;
    float _750 = in.m_55.x;
    float _752 = in.m_55.y;
    float _754 = in.m_55.z;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _744 * 0.15915493667125701904296875;
    float _762 = -_748;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _766 = _716 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = _738 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_742, _742, _746);
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = fma(_764, _764, _774);
    float _784 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _738 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _750 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = sqrt(_782);
    float _802 = _768 * _772;
    float _804 = _758 * _772;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _768 * _788;
    float _812 = _758 * _788;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _816 = _760 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _694 * _800;
    float _822 = _820 * _794;
    float _824 = _820 * _796;
    float _826 = _820 * _798;
    float _828 = _768 * _808;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _832 = _814 * _822;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _836 = _788 * _808;
    float _838 = _830 * _824;
    float _840 = _828 * _832;
    float _842 = _834 * _826;
    float _844 = fma(_818, _810, _804);
    float _846 = _758 * _808;
    float _848 = -_812;
    float _850 = fma(_818, _802, _848);
    float _852 = -_832;
    float _854 = _818 * _852;
    float _856 = fma(_844, _838, _840);
    float _858 = _772 * _808;
    float _860 = -_802;
    float _862 = fma(_818, _812, _860);
    float _864 = _846 * _832;
    float _866 = fma(_836, _838, _854);
    float _868 = -_842;
    float _870 = fma(_850, _868, _856);
    float _872 = fma(_818, _804, _810);
    float _874 = fma(_862, _838, _864);
    float _876 = -_842;
    float _878 = fma(_858, _876, _866);
    float _880 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _884 = -_842;
    float _886 = fma(_872, _884, _874);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _890);
    float _896 = _662 + _892;
    float _898 = _652 + _894;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _896 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _906 = _898 + _904;
    float _908 = _902 * _902;
    float _910 = fma(_906, _906, _908);
    float _912 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = sqrt(_910);
    float _916 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _918 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _920 = _638 + _918;
    bool _922 = _914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _898;
    float _928 = _878;
    float _930 = _730;
    float _932 = _838;
    float _934 = _726;
    if (!_922)
    {
        _924 = _898;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_922)
    {
        _926 = _896;
    }
    float _940 = _926;
    float _942 = _940;
    if (!_922)
    {
        _928 = _920;
    }
    float _944 = _928;
    bool _946 = !_922;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _914 + _952;
        float _956 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_910);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_920, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_906, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _938 = _982;
        _942 = _984;
    }
    float _986 = _948;
    float _988 = _938;
    float _990 = _942;
    float _992 = -_726;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _996 = -_730;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1000 = -_748;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = fma(_1010, _1010, _1016);
    float _1020 = fma(_1014, _1014, _1018);
    float _1022 = rsqrt(_1020);
    float _1024 = sqrt(_1020);
    float _1026 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1028 = _1010 * _1026;
    float _1030 = _1014 * _1026;
    float _1032 = _1028 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 + _1034;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = _1038 + _1042;
    float _1046 = _1014;
    float _1048 = _1036;
    float _1050 = _1044;
    float _1052 = _1006;
    if (_1040)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1054;
    }
    float _1056 = _1046;
    if (_1040)
    {
        float _1058 = rsqrt(_1036);
        _1048 = _1058;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_1040)
    {
        float _1064 = _1044 * _1056;
        _1050 = _1064;
    }
    float _1066 = _1050;
    if (_1040)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _930 = _1068;
    }
    float _1070 = _930;
    float _1072 = _1056;
    if (_1040)
    {
        float _1074 = _1070 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1082 = precise::max(0.0, _1080);
    float _1084 = _1016;
    float _1086 = _1082;
    if (_1040)
    {
        float _1088 = _1070 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        _1084 = _1090;
    }
    float _1092 = _1084;
    float _1094 = -_1026;
    float _1096 = -_1082;
    float _1098 = fma(_1006, _1094, _1096);
    if (!_1040)
    {
        _1052 = _1028;
    }
    float _1100 = _1052;
    float _1102 = _1100;
    if (_1040)
    {
        float _1104 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1104;
    }
    float _1106 = _1086;
    float _1108 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1110 = _1078;
    float _1112 = _1106;
    if (_1040)
    {
        float _1114 = fma(_1078, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1110 = _1114;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    float _1120 = _1092;
    if (_1040)
    {
        float _1122 = _1092 + (-1.0);
        _1112 = _1122;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (_1040)
    {
        float _1128 = _1060 * _1116;
        _932 = _1128;
    }
    float _1130 = _932;
    if (!_1040)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1040)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _1136;
    }
    float _1138 = _934;
    if (_1040)
    {
        float _1140 = _1028 * _1130;
        _1102 = _1140;
    }
    float _1142 = _1102;
    if (!_1040)
    {
        _1126 = _1030;
    }
    float _1144 = _1126;
    float _1146 = _1144;
    if (_1040)
    {
        float _1148 = _1030 * _1130;
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1040)
    {
        _1062 = _1032;
    }
    float _1152 = _1062;
    float _1154 = _1152;
    if (_1040)
    {
        float _1156 = fma(_1098, _1092, _1138);
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (_1040)
    {
        float _1160 = _1142 * _1142;
        _1154 = _1160;
    }
    float _1162 = _1154;
    if (!_1040)
    {
        _1120 = _1034;
    }
    float _1164 = _1120;
    float _1166 = _1164;
    if (_1040)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1158, _1158, _1162);
    float _1174 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1176 = _1172 + _1170;
    float _1178 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1108);
    float _1180 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = rsqrt(_1176);
    float _1190 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1192 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1194 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1196 = -_1186;
    float _1198 = _1196 + 1.0;
    float _1200 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1192);
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1194);
    float _1206 = abs(_1198);
    float _1208 = log2(_1206);
    float _1210 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1216 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1218 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = _1188 * _1142;
    float _1226 = _1188 * _1158;
    float _1228 = _1188 * _1150;
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = -_1232;
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = -_1234;
    float _1246 = fma(_1244, _1174, 1.0);
    float _1248 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = -_1228;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1256 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = log2(_1246);
    float _1262 = fma(_1254, -0.5, 0.5);
    float _1264 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = fma(_1254, 0.5, 0.5);
    float _1270 = _1226 + 1.0;
    float _1272 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1276 = 1.0 / _1250;
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1280 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1274);
    float _1282 = exp2(_1248);
    float _1284 = _1260 * 0.693147182464599609375;
    float _1286 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1288 = sqrt(_1262);
    float _1290 = fma(_1268, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = _1278 * _1276;
    float _1294 = _1280 * _1276;
    float _1296 = fma(_1268, _1290, -0.212114393711090087890625);
    float _1298 = fma(_1292, 0.5, 0.5);
    float _1300 = fma(_1294, -0.5, 0.5);
    float _1302 = -_1226;
    float _1304 = fma(_1282, _1270, _1302);
    float _1306 = fma(_1268, _1296, 1.570728778839111328125);
    float _1308 = fma(_1304, 0.5, 0.5);
    float _1310 = _1288 * 0.636619746685028076171875;
    float3 _4150 = float3(_1298, _1300, _1286);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float _1314 = -_1306;
    float _1316 = fma(_1310, _1314, 1.0);
    float3 _4166 = float3(_1298, _1300, _1286);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4166, float3(0.0), isnan(_4166)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4166, float3(0.0), isnan(_4166)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _4183 = float2(_1316, _1308);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4183, float2(0.0), isnan(_4183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4183, float2(0.0), isnan(_4183)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = in.m_61.y;
    bool _1341 = _164 > 0.5;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = in.m_53.w;
    bool _1347 = _168 > 0.5;
    float _1349 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1353 = _1351 != 0;
    float _1355 = in.m_61.x;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    out.m_63.x = _998;
    out.m_63.y = _994;
    out.m_63.z = _1002;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1369 = _1367 != 0;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1373 = -_1339;
    float _1375 = _1373 + 1.0;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1381 = _1345 > 0.5;
    int _1383 = _1347 ? as_type<int>(_1375) : as_type<int>(_1339);
    int _1385 = _1381 ? as_type<int>(_1375) : as_type<int>(_1339);
    float _1387 = _1359 ? as_type<float>(_1383) : _1339;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    float _1399 = fma(_1379, _1387, -0.5);
    float _1401 = in.m_65.x;
    float _1403 = in.m_65.y;
    float _1405 = in.m_65.z;
    float _1407 = _1393 ? as_type<float>(_1385) : _1339;
    float _1409 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1411 = _1339;
    bool _1413 = _1393;
    int _1415 = as_type<int>(_1399);
    float _1417 = _1361;
    float _1419 = _1343;
    float _1421 = _1280;
    float _1423 = _1278;
    if (_1353)
    {
        float _1425 = _1341 ? _1375 : _1339;
        _1411 = _1425;
    }
    float _1427 = _1411;
    float _1429 = exp2(_1349);
    bool _1431 = _778 != 0.0;
    bool _1433 = isnan(_778);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    if (_1365)
    {
        bool _1441 = _174 > 0.5;
        _1413 = _1441;
    }
    bool _1443 = _1413;
    float _1445 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1447 = _776 == 0.0;
    bool _1449 = !_1439;
    bool _1451 = _1447 && _1449;
    float _1453 = -_492;
    float _1455 = fma(_604, _1399, _1453);
    int _1457 = as_type<int>(_1445);
    float _1459 = _1355;
    if (_1397)
    {
        float _1461 = -_1355;
        float _1463 = _1461 + 1.0;
        _616 = as_type<int>(_1463);
    }
    int _1465 = _616;
    float _1467 = fma(_1407, _1445, -0.5);
    bool _1469 = _780 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = as_type<float>(_1465);
    if (_1365)
    {
        float _1475 = -_1355;
        float _1477 = _1475 + 1.0;
        _1415 = as_type<int>(_1477);
    }
    int _1479 = _1415;
    if (_1369)
    {
        float _1481 = -_1355;
        float _1483 = _1481 + 1.0;
        _1457 = as_type<int>(_1483);
    }
    int _1485 = _1457;
    if (!_1397)
    {
        _1417 = _1355;
    }
    float _1487 = _1417;
    float _1489 = fma(_1409, _1427, -0.5);
    float _1491 = 0.0;
    float _1493 = _1487;
    if (!_1365)
    {
        _1491 = _1355;
    }
    float _1495 = _1491;
    float _1497 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = 0.0;
    float _1501 = _1495;
    if (!_1369)
    {
        _1499 = _1355;
    }
    float _1503 = _1499;
    float _1505 = -_1429;
    float _1507 = _1505 + 1.0;
    float _1509 = _1503;
    if (_1397)
    {
        float _1511 = _1347 ? as_type<float>(_1465) : _1355;
        _1493 = _1511;
    }
    float _1513 = _1493;
    if (_1365)
    {
        float _1515 = _1443 ? as_type<float>(_1479) : _1355;
        _1501 = _1515;
    }
    float _1517 = _1501;
    float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = 0.0;
    if (_1471)
    {
        _1521 = _1401;
    }
    float _1523 = _1521;
    float _1525 = _1523;
    if (_1369)
    {
        float _1527 = _1341 ? as_type<float>(_1485) : _1355;
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1471)
    {
        _1473 = _1523;
    }
    float _1531 = _1473;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    float _1539 = in.m_67.w;
    float _1541 = _1531;
    if (!_1471)
    {
        _1525 = _1401;
    }
    float _1543 = _1525;
    float _1545 = fma(_1497, _1529, -0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1549 = 0.0;
    if (_1471)
    {
        _1549 = _1403;
    }
    float _1551 = _1549;
    float _1553 = _1551;
    if (_1471)
    {
        _1459 = _1405;
    }
    float _1555 = _1459;
    float _1557 = fma(_582, _1545, _594);
    float _1559 = _1555;
    if (_1471)
    {
        _618 = _1551;
    }
    float _1561 = _618;
    float _1563 = _1561;
    if (!_1471)
    {
        float _1565 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1543);
        _1541 = _1565;
    }
    float _1567 = _1541;
    if (_1471)
    {
        _1419 = _1555;
    }
    float _1569 = _1419;
    float _1571 = _1569;
    if (!_1471)
    {
        _1553 = _1403;
    }
    float _1573 = _1553;
    float _1575 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1471)
    {
        _1559 = _1405;
    }
    float _1577 = _1559;
    float _1579 = fma(_1575, _1517, -0.5);
    float _1581 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1471)
    {
        float _1583 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1563 = _1583;
    }
    float _1585 = _1563;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1471)
    {
        float _1589 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1571 = _1589;
    }
    float _1591 = _1571;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1597 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1581, _1513, -0.5);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1537 * _1543;
    float _1607 = _1535 * _1577;
    float _1609 = _1533 * _1573;
    float _1611 = fma(_590, _1599, _588);
    out.m_69.x = _1597;
    out.m_69.y = _1601;
    out.m_69.z = _1603;
    float _1613 = fma(_598, _1579, _602);
    float _1615 = -_1605;
    float _1617 = fma(_1533, _1577, _1615);
    float _1619 = -_1607;
    float _1621 = fma(_1537, _1573, _1619);
    float _1623 = -_1609;
    float _1625 = fma(_1535, _1543, _1623);
    float _1627 = -_558;
    float _1629 = fma(_608, _1467, _1627);
    float _1631 = _1617 * _1539;
    float _1633 = _1455 + 0.5;
    float _1635 = _1613 + 0.5;
    float _1637 = _1557 + 0.5;
    float _1639 = _1629 + 0.5;
    float _1641 = _1621 * _1539;
    float _1643 = _1611 + 0.5;
    float _1645 = -_610;
    float _1647 = fma(_606, _1489, _1645);
    float _1649 = -_1591;
    float _1651 = _818 * _1649;
    float _1653 = -_1537;
    float _1655 = _818 * _1653;
    float _1657 = _1625 * _1539;
    out.m_71.x = _1635;
    out.m_71.y = _1633;
    out.m_71.z = _1637;
    out.m_71.w = _1639;
    float _1659 = fma(_836, _1567, _1651);
    float _1661 = fma(_836, _1533, _1655);
    float _1663 = _828 * _1591;
    float _1665 = _828 * _1537;
    float _1667 = -_1657;
    float _1669 = _818 * _1667;
    float _1671 = _828 * _1657;
    float _1673 = _846 * _1657;
    float _1675 = _1647 + 0.5;
    float _1677 = fma(_836, _1641, _1669);
    float _1679 = _846 * _1537;
    float _1681 = fma(_862, _1641, _1673);
    float _1683 = _846 * _1591;
    out.m_73.x = _1643;
    out.m_73.y = _1675;
    float _1685 = fma(_844, _1567, _1663);
    float _1687 = fma(_844, _1533, _1665);
    float _1689 = fma(_844, _1641, _1671);
    float _1691 = fma(_862, _1533, _1679);
    float _1693 = -_1585;
    float _1695 = fma(_850, _1693, _1685);
    float _1697 = -_1535;
    float _1699 = fma(_850, _1697, _1687);
    float _1701 = -_1535;
    float _1703 = fma(_858, _1701, _1661);
    float _1705 = -_1631;
    float _1707 = fma(_858, _1705, _1677);
    float _1709 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = -_1631;
    float _1717 = fma(_850, _1715, _1689);
    float _1719 = -_1631;
    float _1721 = fma(_872, _1719, _1681);
    float _1723 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1729 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1731 = fma(_862, _1567, _1683);
    float _1733 = -_1585;
    float _1735 = fma(_858, _1733, _1659);
    float _1737 = -_1535;
    float _1739 = fma(_872, _1737, _1691);
    float _1741 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1743 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1725);
    float _1745 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1727);
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1729);
    float _1749 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1751 = -_1585;
    float _1753 = fma(_872, _1751, _1731);
    float _1755 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1709);
    float _1757 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1759 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1763 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1741);
    float _1765 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1749);
    float _1767 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1745);
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1747);
    float _1771 = _1250 * 0.5;
    float _1773 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1777 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1779 = fma(_1280, -0.5, _1771);
    float _1781 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1757);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1755);
    float _1787 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1789 = _1773 + _1250;
    float _1791 = _1278 + _1250;
    float _1793 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1795 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1783);
    float _1797 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1777);
    float _1799 = _1789 * 0.5;
    float _1801 = _1791 * 0.5;
    float _1803 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1787);
    out.m_75.x = _1793;
    out.m_75.y = _1775;
    out.m_75.z = _1795;
    bool _1805 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1024);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    out.m_77.x = _1801;
    out.m_77.y = _1779;
    out.m_77.z = _1799;
    out.m_77.w = _1250;
    out.m_79.x = _1785;
    out.m_79.y = _1797;
    out.m_79.z = _1803;
    out.m_81.x = _1763;
    out.m_81.y = _1767;
    out.m_81.z = _1769;
    out.gl_Position.x = _1278;
    out.gl_Position.y = _1280;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1250;
    float _1815 = _1769;
    float _1817 = _1767;
    float _1819 = _1763;
    if (!_1813)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1821 = _1815;
    float _1823 = _1821;
    float _1825 = _1821;
    if (!_1813)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1827;
    if (!_1813)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1813)
    {
        _1421 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1839 = _1421;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1813)
    {
        _1423 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1845 = _1423;
    float _1847 = _1519 * _1312;
    float _1849 = -_1519;
    float _1851 = _1849 + 1.0;
    float _1853 = _1327 * _1847;
    float _1855 = _1327 * _1851;
    float _1857 = _1337 * _1847;
    float _1859 = fma(_1333, _1853, _1321);
    float _1861 = fma(_1335, _1853, _1323);
    float _1863 = _1853;
    float _1865 = _1845;
    float _1867 = _1845;
    if (!_1813)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1863;
    float _1871 = fma(_1327, _1857, _1325);
    out.m_83.x = _1859;
    out.m_83.y = _1861;
    out.m_83.z = _1871;
    out.m_83.w = _1855;
    bool _1873 = !_1813;
    float _1875 = _1869;
    float _1877 = _1869;
    if (!_1873)
    {
        bool _1879 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1881 = isnan(_1024);
        bool _1883 = _1879 || _1881;
        bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1887 = _1883 || _1885;
        if (!_1887)
        {
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1891 = _1024 + _1889;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1893;
            float _1897 = 1.0 / _1895;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1919 = _1891 * _1897;
            float _1921 = precise::clamp(_1919, 0.0, 1.0);
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = fma(_1921, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1921, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1931 = fma(_1921, _1901, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1933 = fma(_1921, _1909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1935 = fma(_1921, _1913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1937 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1831 = _1931;
            _1867 = _1935;
            _1825 = _1929;
            _1843 = _1933;
            _1837 = _1927;
            _1877 = _1937;
            _1939 = true;
        }
        else
        {
            bool _1941 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1943 = isnan(_1024);
            bool _1945 = _1941 || _1943;
            bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1949 = _1945 || _1947;
            if (!_1949)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1951 = _1841;
            _1843 = _1951;
            if (!_1949)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1953 = _1865;
            _1867 = _1953;
            if (!_1949)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1955 = _1875;
            _1877 = _1955;
            if (!_1949)
            {
                _1823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1957 = _1823;
            _1825 = _1957;
            if (!_1949)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1959 = _1829;
            _1831 = _1959;
            if (!_1949)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1961 = _1835;
            bool _1963 = !_1949;
            _1837 = _1961;
            if (!_1963)
            {
                bool _1965 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1967 = isnan(_1024);
                bool _1969 = _1965 || _1967;
                bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1973 = _1969 || _1971;
                if (!_1973)
                {
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1977 = _1024 + _1975;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1979;
                    float _1983 = 1.0 / _1981;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2005 = _1977 * _1983;
                    float _2007 = precise::clamp(_2005, 0.0, 1.0);
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = fma(_2007, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2007, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2017 = fma(_2007, _1987, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2019 = fma(_2007, _1995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2021 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2023 = fma(_2007, _2003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1831 = _2017;
                    _1867 = _2021;
                    _1825 = _2015;
                    _1843 = _2019;
                    _1837 = _2013;
                    _1877 = _2023;
                    _1939 = true;
                }
                else
                {
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1939 = false;
    float _2025 = _1831;
    float _2027 = _1867;
    float _2029 = _1825;
    float _2031 = _1843;
    float _2033 = _1837;
    float _2035 = _1877;
    float _2037 = fma(_1797, -0.5, 0.5);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = -_2025;
    float _2043 = _2027 + _2041;
    float _2045 = -_2029;
    float _2047 = _2031 + _2045;
    float _2049 = -_2033;
    float _2051 = _2035 + _2049;
    bool _2053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2055 = fma(_2039, _2043, _2025);
    float _2057 = fma(_2039, _2047, _2029);
    float _2059 = fma(_2039, _2051, _2033);
    float _2061 = _2055 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2063 = fma(_2057, 0.298911988735198974609375, _2061);
    float _2065 = fma(_2059, 0.114477999508380889892578125, _2063);
    out.m_85.x = 0.0;
    float _2067 = -_2065;
    float _2069 = _2057 + _2067;
    float _2071 = -_2065;
    float _2073 = _2055 + _2071;
    float _2075 = -_2065;
    float _2077 = _2059 + _2075;
    float _2079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2085 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_87.w = _2079;
    out.m_89.x = _2081;
    out.m_89.y = _2083;
    out.m_89.z = _2085;
    if (!_2053)
    {
        return out;
    }
    float _2087 = -_994;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2091 = -_998;
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2095 = -_1002;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = sqrt(_2103);
    float _2107 = rsqrt(_2103);
    float _2109 = -_2105;
    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2113 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2115 = precise::clamp(_2113, 0.0, 1.0);
    float _2117 = _2093 * _2107;
    float _2119 = _2089 * _2107;
    float _2121 = abs(_2115);
    float _2123 = log2(_2121);
    float _2125 = _2097 * _2107;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2129 = _1797 * _2119;
    float _2131 = -_2119;
    float _2133 = -_2127;
    float _2135 = fma(_2131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2133);
    float _2137 = fma(_1785, _2117, _2129);
    float _2139 = -_2125;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2135);
    float _2143 = fma(_1803, _2125, _2137);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2149 = _2141 + _2147;
    float _2151 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = exp2(_2151);
    float _2159 = _2157 * _2155;
    float _2161 = _2145 * _2159;
    float _2163 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2165 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2163;
    out.m_85.y = _2165;
    out.m_85.z = _2167;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1939 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_122);
        out.gl_Position.z = _2223;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2295 = as_type<float>(_162);
        out.gl_Position.z = _2295;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.y;
    int _170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _172 = _170 != 0;
    float _174 = in.m_53.x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _180 = in.m_55.w;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _184 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _186 = _164 * 2.0;
    float _188 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _192 = _168 * 2.0;
    float _194 = floor(_186);
    float _196 = 0.0;
    float _198 = _166;
    if (!_172)
    {
        _196 = _168;
    }
    float _200 = _196;
    float _202 = _174 * 2.0;
    float _204 = _174 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _206 = floor(_192);
    float _208 = _168 + _174;
    float _210 = -_176;
    float _212 = fma(_204, 2.0, _210);
    float _214 = _208 + (-1.0);
    float _216 = floor(_202);
    bool _218 = _194 > 0.0;
    float _220 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _222 = _194 >= 0.0;
    bool _224 = isnan(_194);
    bool _226 = _222 || _224;
    bool _228 = isnan(0.0);
    bool _230 = _226 || _228;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _234 = _200;
    float _236 = _214;
    if (_172)
    {
        _232 = _174;
    }
    float _238 = _232;
    float _240 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _242 = _238;
    float _244 = _240;
    if (!_172)
    {
        _242 = _164;
    }
    float _246 = _242;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _250 = _206 > 0.0;
    float _252 = fma(_240, -2.0, _178);
    if (!_172)
    {
        _244 = _200;
    }
    float _254 = _244;
    bool _256 = _206 >= 0.0;
    bool _258 = isnan(_206);
    bool _260 = _256 || _258;
    bool _262 = isnan(0.0);
    bool _264 = _260 || _262;
    float _266 = _254;
    if (_172)
    {
        _266 = _174;
    }
    float _268 = _266;
    if (_172)
    {
        _234 = _168;
    }
    float _270 = _234;
    float _272 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[83].z, _248);
    bool _274 = _216 > 0.0;
    bool _276 = _216 >= 0.0;
    bool _278 = isnan(_216);
    bool _280 = _276 || _278;
    bool _282 = isnan(0.0);
    bool _284 = _280 || _282;
    float _286 = _246 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _288 = _270;
    if (!_172)
    {
        _236 = _164;
    }
    float _290 = _236;
    float _292 = _268 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _294 = _230 ? 0 : 1;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _298 = _290;
    if (_172)
    {
        _298 = _270;
    }
    float _300 = _298;
    float _302 = -_184;
    float _304 = fma(_286, 2.0, _302);
    int _306 = ~_294;
    int _308 = _306 + 1;
    int _310 = _308 + 1;
    float _312 = -_182;
    float _314 = fma(_292, 2.0, _312);
    int _316 = _310;
    if (!_218)
    {
        int _318 = ~_294;
        int _320 = _318 + 1;
        _316 = _320;
    }
    int _322 = _316;
    float _324 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[83].w, _296);
    float _326 = in.m_49.x;
    float _328 = in.m_49.y;
    float _330 = in.m_49.z;
    bool _332 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _336 = _332 || _334;
    bool _338 = isnan(1.0);
    bool _340 = _336 || _338;
    float _342 = _284 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _344 = in.m_44.x;
    float _346 = in.m_44.y;
    float _348 = in.m_44.z;
    float _350 = _264 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _352 = ~as_type<int>(_342);
    int _354 = _352 + 1;
    int _356 = _354 + 1;
    int _358 = _356;
    float _360 = _342;
    float _362 = _350;
    if (!_274)
    {
        int _364 = ~as_type<int>(_342);
        int _366 = _364 + 1;
        _358 = _366;
    }
    int _368 = _358;
    if (!_172)
    {
        _360 = _164;
    }
    float _370 = _360;
    float _372 = _370;
    if (_172)
    {
        _372 = _270;
    }
    float _374 = _372;
    int _376 = ~as_type<int>(_350);
    int _378 = _376 + 1;
    int _380 = _378 + 1;
    int _382 = _380;
    if (!_172)
    {
        _288 = _174;
    }
    float _384 = _288;
    float _386 = _374 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _388 = _384;
    if (!_250)
    {
        int _390 = ~as_type<int>(_350);
        int _392 = _390 + 1;
        _382 = _392;
    }
    int _394 = _382;
    if (!_340)
    {
        float _396 = _166 * _166;
        float _398 = _396 * 0.5;
        _362 = _398;
    }
    float _400 = _362;
    float _402 = _384 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_340)
    {
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _404;
    }
    float _406 = _388;
    bool _408 = !_340;
    float _410 = _406;
    if (!_408)
    {
        float _412 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _414 = log2(_412);
        float _416 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _418 = _416 + 1.0;
        float _420 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _422 = _166 * _414;
        float _424 = 1.0 / _418;
        float _426 = _420 * 0.693147182464599609375;
        float _428 = exp2(_422);
        float _430 = 1.0 / _426;
        float _432 = _428 + (-1.0);
        float _434 = -_432;
        float _436 = fma(_434, _430, _166);
        float _438 = _436 * _424;
        float _440 = _438 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _410 = _440;
    }
    float _442 = _410;
    bool _444 = !_340;
    if (!_444)
    {
        float _446 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _448 = log2(_446);
        float _450 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _452 = _450 + 1.0;
        float _454 = 1.0 / _452;
        float _456 = _166 * _448;
        float _458 = exp2(_456);
        float _460 = -_458;
        float _462 = _460 + 1.0;
        float _464 = _462 * _454;
        _198 = _464;
    }
    float _466 = _198;
    float _468 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _470 = log2(_468);
    float _472 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _476 = fma(_402, -2.0, _188);
    float _478 = _442 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = fma(_466, _328, _472);
    float _482 = fma(_466, _326, _474);
    float _484 = fma(_386, -2.0, _190);
    float _486 = fma(_480, _180, _346);
    float _488 = fma(_482, _180, _344);
    float _490 = fma(_466, _330, _478);
    float _492 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _252);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _500 = _498 != 0;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _504 = _502 != 0;
    float _506 = _470 * _134;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _510 = 1.0 + _508;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _514 = fma(_490, _180, _348);
    float _516 = exp2(_506);
    float _518 = in.m_57.x;
    float _520 = in.m_57.y;
    float _522 = in.m_57.z;
    float _524 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _512);
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    float _538 = 1.0 / _510;
    bool _540 = !_496;
    int _542 = _540 ? 0 : 1;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _554 = _550 || _552;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _558 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _484);
    float _560 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[88].z, _526);
    bool _562 = !_500;
    int _564 = _562 ? 0 : 1;
    float _566 = -_516;
    float _568 = _566 + 1.0;
    int _570 = abs(_542);
    float _572 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[78].z, _544);
    float _574 = float(_322);
    float _576 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _556);
    float _578 = _554 ? _568 : 0.0;
    float _580 = _486 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _582 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _272);
    float _584 = float(_570);
    float _586 = -_134;
    float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[86].x, _304);
    float _590 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _560);
    float _592 = -_134;
    float _594 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[81].x, _314);
    int _596 = abs(_564);
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _572);
    float _600 = -_134;
    float _602 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[76].x, _212);
    float _604 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _524);
    float _606 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _576);
    float _608 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _324);
    float _610 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _476);
    float _612 = _486 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _614 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[5].x, _580);
    int _616 = as_type<int>(_492);
    float _618 = _604;
    if (_536)
    {
        float _620 = _578 * _538;
        _156 = _620;
    }
    float _622 = _156;
    float _624 = _486 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _626 = _584 * _574;
    float _628 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[4].x, _612);
    float _630 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _632 = fma(_488, (*spvDescriptorSet0.vp_c10)._m0[6].x, _624);
    float _634 = _626 * (-2.0);
    float _636 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[4].z, _628);
    float _638 = _630 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _640 = float(_368);
    float _642 = fma(_514, (*spvDescriptorSet0.vp_c10)._m0[6].z, _632);
    float _644 = float(_596);
    float _646 = fma(_634, _518, _518);
    float _648 = _174 + (-0.5);
    float _650 = fma(_220, _634, _220);
    float _652 = _636 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _638 + _654;
    float _658 = _644 * _640;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _646);
    float _662 = _642 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _666 = _652 + _664;
    float _668 = _656 * _656;
    bool _670 = !_504;
    int _672 = _670 ? 0 : 1;
    float _674 = fma(_650, _622, _660);
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _662 + _676;
    float _680 = fma(_666, _666, _668);
    int _682 = abs(_672);
    float _684 = _168 + _164;
    float _686 = fma(_678, _678, _680);
    float _688 = float(_394);
    float _690 = _684 + (-1.0);
    float _692 = float(_682);
    float _694 = rsqrt(_686);
    float _696 = _658 * (-2.0);
    float _698 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _700 = _168 + (-0.5);
    float _702 = _692 * _688;
    float _704 = fma(_696, _520, _520);
    float _706 = _174 + _164;
    float _708 = fma(_698, _696, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].y, _704);
    float _712 = _706 + (-1.0);
    float _714 = _702 * (-2.0);
    float _716 = _674 * 0.15915493667125701904296875;
    float _718 = fma(_708, _622, _710);
    float _720 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_714, _522, _522);
    float _724 = _164 + (-0.5);
    float _726 = _656 * _694;
    float _728 = fma(_720, _714, _720);
    float _730 = _666 * _694;
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _722);
    float _734 = -_726;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _738 = _718 * 0.15915493667125701904296875;
    float _740 = -_730;
    float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _744 = fma(_728, _622, _732);
    float _746 = _736 * _736;
    float _748 = _678 * _694;
    float _750 = in.m_55.x;
    float _752 = in.m_55.y;
    float _754 = in.m_55.z;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _744 * 0.15915493667125701904296875;
    float _762 = -_748;
    float _764 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _766 = _716 * 6.283185482025146484375;
    float _768 = cos(_766);
    float _770 = _738 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = fma(_742, _742, _746);
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = fma(_764, _764, _774);
    float _784 = _754 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _786 = _738 * 6.283185482025146484375;
    float _788 = cos(_786);
    float _790 = _750 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _792 = _752 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _794 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _796 = _790 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _798 = _792 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _800 = sqrt(_782);
    float _802 = _768 * _772;
    float _804 = _758 * _772;
    float _806 = _760 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _768 * _788;
    float _812 = _758 * _788;
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _816 = _760 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _694 * _800;
    float _822 = _820 * _794;
    float _824 = _820 * _796;
    float _826 = _820 * _798;
    float _828 = _768 * _808;
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _832 = _814 * _822;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _836 = _788 * _808;
    float _838 = _830 * _824;
    float _840 = _828 * _832;
    float _842 = _834 * _826;
    float _844 = fma(_818, _810, _804);
    float _846 = _758 * _808;
    float _848 = -_812;
    float _850 = fma(_818, _802, _848);
    float _852 = -_832;
    float _854 = _818 * _852;
    float _856 = fma(_844, _838, _840);
    float _858 = _772 * _808;
    float _860 = -_802;
    float _862 = fma(_818, _812, _860);
    float _864 = _846 * _832;
    float _866 = fma(_836, _838, _854);
    float _868 = -_842;
    float _870 = fma(_850, _868, _856);
    float _872 = fma(_818, _804, _810);
    float _874 = fma(_862, _838, _864);
    float _876 = -_842;
    float _878 = fma(_858, _876, _866);
    float _880 = _870 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = _870 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _884 = -_842;
    float _886 = fma(_872, _884, _874);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[8].x, _882);
    float _892 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[10].z, _888);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[8].z, _890);
    float _896 = _662 + _892;
    float _898 = _652 + _894;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _902 = _896 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _906 = _898 + _904;
    float _908 = _902 * _902;
    float _910 = fma(_906, _906, _908);
    float _912 = _870 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = sqrt(_910);
    float _916 = fma(_878, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _918 = fma(_886, (*spvDescriptorSet0.vp_c10)._m0[9].z, _916);
    float _920 = _638 + _918;
    bool _922 = _914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _924 = _916;
    float _926 = _898;
    float _928 = _878;
    float _930 = _730;
    float _932 = _838;
    float _934 = _726;
    if (!_922)
    {
        _924 = _898;
    }
    float _936 = _924;
    float _938 = _936;
    if (!_922)
    {
        _926 = _896;
    }
    float _940 = _926;
    float _942 = _940;
    if (!_922)
    {
        _928 = _920;
    }
    float _944 = _928;
    bool _946 = !_922;
    float _948 = _944;
    if (!_946)
    {
        float _950 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _952 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _954 = _914 + _952;
        float _956 = _920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = rsqrt(_910);
        float _960 = _954 * _950;
        float _962 = _960 * 0.15915493667125701904296875;
        float _964 = _962 * 6.283185482025146484375;
        float _966 = cos(_964);
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        float _972 = _966 + (-1.0);
        float _974 = _972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _976 = fma(_970, _956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _978 = fma(_920, _966, _974);
        float _980 = _958 * _976;
        float _982 = fma(_906, _980, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _984 = fma(_902, _980, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _948 = _978;
        _938 = _982;
        _942 = _984;
    }
    float _986 = _948;
    float _988 = _938;
    float _990 = _942;
    float _992 = -_726;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _986);
    float _996 = -_730;
    float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    float _1000 = -_748;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1006 = _994 + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1014 = _1002 + _1012;
    float _1016 = _1006 * _1006;
    float _1018 = fma(_1010, _1010, _1016);
    float _1020 = fma(_1014, _1014, _1018);
    float _1022 = rsqrt(_1020);
    float _1024 = sqrt(_1020);
    float _1026 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1028 = _1010 * _1026;
    float _1030 = _1014 * _1026;
    float _1032 = _1028 * _1028;
    float _1034 = _1030 * _1030;
    float _1036 = _1032 + _1034;
    float _1038 = sqrt(_1036);
    bool _1040 = _1038 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1044 = _1038 + _1042;
    float _1046 = _1014;
    float _1048 = _1036;
    float _1050 = _1044;
    float _1052 = _1006;
    if (_1040)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1046 = _1054;
    }
    float _1056 = _1046;
    if (_1040)
    {
        float _1058 = rsqrt(_1036);
        _1048 = _1058;
    }
    float _1060 = _1048;
    float _1062 = _1060;
    if (_1040)
    {
        float _1064 = _1044 * _1056;
        _1050 = _1064;
    }
    float _1066 = _1050;
    if (_1040)
    {
        float _1068 = _1066 * 0.15915493667125701904296875;
        _930 = _1068;
    }
    float _1070 = _930;
    float _1072 = _1056;
    if (_1040)
    {
        float _1074 = _1070 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        _1072 = _1076;
    }
    float _1078 = _1072;
    float _1080 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1082 = precise::max(0.0, _1080);
    float _1084 = _1016;
    float _1086 = _1082;
    if (_1040)
    {
        float _1088 = _1070 * 6.283185482025146484375;
        float _1090 = cos(_1088);
        _1084 = _1090;
    }
    float _1092 = _1084;
    float _1094 = -_1026;
    float _1096 = -_1082;
    float _1098 = fma(_1006, _1094, _1096);
    if (!_1040)
    {
        _1052 = _1028;
    }
    float _1100 = _1052;
    float _1102 = _1100;
    if (_1040)
    {
        float _1104 = _1098 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1086 = _1104;
    }
    float _1106 = _1086;
    float _1108 = _994 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1110 = _1078;
    float _1112 = _1106;
    if (_1040)
    {
        float _1114 = fma(_1078, _1106, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1110 = _1114;
    }
    float _1116 = _1110;
    float _1118 = _1116;
    float _1120 = _1092;
    if (_1040)
    {
        float _1122 = _1092 + (-1.0);
        _1112 = _1122;
    }
    float _1124 = _1112;
    float _1126 = _1124;
    if (_1040)
    {
        float _1128 = _1060 * _1116;
        _932 = _1128;
    }
    float _1130 = _932;
    if (!_1040)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1040)
    {
        float _1136 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _1136;
    }
    float _1138 = _934;
    if (_1040)
    {
        float _1140 = _1028 * _1130;
        _1102 = _1140;
    }
    float _1142 = _1102;
    if (!_1040)
    {
        _1126 = _1030;
    }
    float _1144 = _1126;
    float _1146 = _1144;
    if (_1040)
    {
        float _1148 = _1030 * _1130;
        _1146 = _1148;
    }
    float _1150 = _1146;
    if (!_1040)
    {
        _1062 = _1032;
    }
    float _1152 = _1062;
    float _1154 = _1152;
    if (_1040)
    {
        float _1156 = fma(_1098, _1092, _1138);
        _1134 = _1156;
    }
    float _1158 = _1134;
    if (_1040)
    {
        float _1160 = _1142 * _1142;
        _1154 = _1160;
    }
    float _1162 = _1154;
    if (!_1040)
    {
        _1120 = _1034;
    }
    float _1164 = _1120;
    float _1166 = _1164;
    if (_1040)
    {
        float _1168 = _1150 * _1150;
        _1166 = _1168;
    }
    float _1170 = _1166;
    float _1172 = fma(_1158, _1158, _1162);
    float _1174 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1176 = _1172 + _1170;
    float _1178 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1108);
    float _1180 = _994 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1182 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1184 = fma(_1024, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1182);
    float _1186 = precise::clamp(_1184, 0.0, 1.0);
    float _1188 = rsqrt(_1176);
    float _1190 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1178);
    float _1192 = _994 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1194 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1180);
    float _1196 = -_1186;
    float _1198 = _1196 + 1.0;
    float _1200 = _994 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1202 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1192);
    float _1204 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1194);
    float _1206 = abs(_1198);
    float _1208 = log2(_1206);
    float _1210 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1200);
    float _1212 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1202);
    float _1214 = _1204 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1216 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1218 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1210);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1222 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1224 = _1188 * _1142;
    float _1226 = _1188 * _1158;
    float _1228 = _1188 * _1150;
    float _1230 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1222);
    float _1232 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1234 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1236 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1230);
    float _1240 = -_1232;
    float _1242 = fma(_1226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = -_1234;
    float _1246 = fma(_1244, _1174, 1.0);
    float _1248 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1238);
    float _1252 = -_1228;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1256 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1260 = log2(_1246);
    float _1262 = fma(_1254, -0.5, 0.5);
    float _1264 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1258);
    float _1268 = fma(_1254, 0.5, 0.5);
    float _1270 = _1226 + 1.0;
    float _1272 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1266);
    float _1276 = 1.0 / _1250;
    float _1278 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1280 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1274);
    float _1282 = exp2(_1248);
    float _1284 = _1260 * 0.693147182464599609375;
    float _1286 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1288 = sqrt(_1262);
    float _1290 = fma(_1268, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1292 = _1278 * _1276;
    float _1294 = _1280 * _1276;
    float _1296 = fma(_1268, _1290, -0.212114393711090087890625);
    float _1298 = fma(_1292, 0.5, 0.5);
    float _1300 = fma(_1294, -0.5, 0.5);
    float _1302 = -_1226;
    float _1304 = fma(_1282, _1270, _1302);
    float _1306 = fma(_1268, _1296, 1.570728778839111328125);
    float _1308 = fma(_1304, 0.5, 0.5);
    float _1310 = _1288 * 0.636619746685028076171875;
    float3 _4150 = float3(_1298, _1300, _1286);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float _1314 = -_1306;
    float _1316 = fma(_1310, _1314, 1.0);
    float3 _4166 = float3(_1298, _1300, _1286);
    float4 _1319 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4166, float3(0.0), isnan(_4166)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4166, float3(0.0), isnan(_4166)), level(0.0)).xyzw;
    float _1321 = _1319.x;
    float _1323 = _1319.y;
    float _1325 = _1319.z;
    float _1327 = _1319.w;
    float2 _4183 = float2(_1316, _1308);
    float3 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4183, float2(0.0), isnan(_4183)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4183, float2(0.0), isnan(_4183)), level(0.0)).xyz;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = in.m_61.y;
    bool _1341 = _164 > 0.5;
    float _1343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1345 = in.m_53.w;
    bool _1347 = _168 > 0.5;
    float _1349 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1353 = _1351 != 0;
    float _1355 = in.m_61.x;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1359 = _1357 != 0;
    float _1361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1365 = _1363 != 0;
    out.m_63.x = _998;
    out.m_63.y = _994;
    out.m_63.z = _1002;
    int _1367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1369 = _1367 != 0;
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1373 = -_1339;
    float _1375 = _1373 + 1.0;
    float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1379 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1381 = _1345 > 0.5;
    int _1383 = _1347 ? as_type<int>(_1375) : as_type<int>(_1339);
    int _1385 = _1381 ? as_type<int>(_1375) : as_type<int>(_1339);
    float _1387 = _1359 ? as_type<float>(_1383) : _1339;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1393 = _1391 != 0;
    int _1395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1397 = _1395 != 0;
    float _1399 = fma(_1379, _1387, -0.5);
    float _1401 = in.m_65.x;
    float _1403 = in.m_65.y;
    float _1405 = in.m_65.z;
    float _1407 = _1393 ? as_type<float>(_1385) : _1339;
    float _1409 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1411 = _1339;
    bool _1413 = _1393;
    int _1415 = as_type<int>(_1399);
    float _1417 = _1361;
    float _1419 = _1343;
    float _1421 = _1280;
    float _1423 = _1278;
    if (_1353)
    {
        float _1425 = _1341 ? _1375 : _1339;
        _1411 = _1425;
    }
    float _1427 = _1411;
    float _1429 = exp2(_1349);
    bool _1431 = _778 != 0.0;
    bool _1433 = isnan(_778);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    if (_1365)
    {
        bool _1441 = _174 > 0.5;
        _1413 = _1441;
    }
    bool _1443 = _1413;
    float _1445 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1447 = _776 == 0.0;
    bool _1449 = !_1439;
    bool _1451 = _1447 && _1449;
    float _1453 = -_492;
    float _1455 = fma(_604, _1399, _1453);
    int _1457 = as_type<int>(_1445);
    float _1459 = _1355;
    if (_1397)
    {
        float _1461 = -_1355;
        float _1463 = _1461 + 1.0;
        _616 = as_type<int>(_1463);
    }
    int _1465 = _616;
    float _1467 = fma(_1407, _1445, -0.5);
    bool _1469 = _780 == 0.0;
    bool _1471 = _1469 && _1451;
    float _1473 = as_type<float>(_1465);
    if (_1365)
    {
        float _1475 = -_1355;
        float _1477 = _1475 + 1.0;
        _1415 = as_type<int>(_1477);
    }
    int _1479 = _1415;
    if (_1369)
    {
        float _1481 = -_1355;
        float _1483 = _1481 + 1.0;
        _1457 = as_type<int>(_1483);
    }
    int _1485 = _1457;
    if (!_1397)
    {
        _1417 = _1355;
    }
    float _1487 = _1417;
    float _1489 = fma(_1409, _1427, -0.5);
    float _1491 = 0.0;
    float _1493 = _1487;
    if (!_1365)
    {
        _1491 = _1355;
    }
    float _1495 = _1491;
    float _1497 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1499 = 0.0;
    float _1501 = _1495;
    if (!_1369)
    {
        _1499 = _1355;
    }
    float _1503 = _1499;
    float _1505 = -_1429;
    float _1507 = _1505 + 1.0;
    float _1509 = _1503;
    if (_1397)
    {
        float _1511 = _1347 ? as_type<float>(_1465) : _1355;
        _1493 = _1511;
    }
    float _1513 = _1493;
    if (_1365)
    {
        float _1515 = _1443 ? as_type<float>(_1479) : _1355;
        _1501 = _1515;
    }
    float _1517 = _1501;
    float _1519 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1521 = 0.0;
    if (_1471)
    {
        _1521 = _1401;
    }
    float _1523 = _1521;
    float _1525 = _1523;
    if (_1369)
    {
        float _1527 = _1341 ? as_type<float>(_1485) : _1355;
        _1509 = _1527;
    }
    float _1529 = _1509;
    if (_1471)
    {
        _1473 = _1523;
    }
    float _1531 = _1473;
    float _1533 = in.m_67.x;
    float _1535 = in.m_67.y;
    float _1537 = in.m_67.z;
    float _1539 = in.m_67.w;
    float _1541 = _1531;
    if (!_1471)
    {
        _1525 = _1401;
    }
    float _1543 = _1525;
    float _1545 = fma(_1497, _1529, -0.5);
    float _1547 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1549 = 0.0;
    if (_1471)
    {
        _1549 = _1403;
    }
    float _1551 = _1549;
    float _1553 = _1551;
    if (_1471)
    {
        _1459 = _1405;
    }
    float _1555 = _1459;
    float _1557 = fma(_582, _1545, _594);
    float _1559 = _1555;
    if (_1471)
    {
        _618 = _1551;
    }
    float _1561 = _618;
    float _1563 = _1561;
    if (!_1471)
    {
        float _1565 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1543);
        _1541 = _1565;
    }
    float _1567 = _1541;
    if (_1471)
    {
        _1419 = _1555;
    }
    float _1569 = _1419;
    float _1571 = _1569;
    if (!_1471)
    {
        _1553 = _1403;
    }
    float _1573 = _1553;
    float _1575 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_1471)
    {
        _1559 = _1405;
    }
    float _1577 = _1559;
    float _1579 = fma(_1575, _1517, -0.5);
    float _1581 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1471)
    {
        float _1583 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1573);
        _1563 = _1583;
    }
    float _1585 = _1563;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (!_1471)
    {
        float _1589 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1577);
        _1571 = _1589;
    }
    float _1591 = _1571;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1597 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1599 = fma(_1581, _1513, -0.5);
    float _1601 = _1593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1537 * _1543;
    float _1607 = _1535 * _1577;
    float _1609 = _1533 * _1573;
    float _1611 = fma(_590, _1599, _588);
    out.m_69.x = _1597;
    out.m_69.y = _1601;
    out.m_69.z = _1603;
    float _1613 = fma(_598, _1579, _602);
    float _1615 = -_1605;
    float _1617 = fma(_1533, _1577, _1615);
    float _1619 = -_1607;
    float _1621 = fma(_1537, _1573, _1619);
    float _1623 = -_1609;
    float _1625 = fma(_1535, _1543, _1623);
    float _1627 = -_558;
    float _1629 = fma(_608, _1467, _1627);
    float _1631 = _1617 * _1539;
    float _1633 = _1455 + 0.5;
    float _1635 = _1613 + 0.5;
    float _1637 = _1557 + 0.5;
    float _1639 = _1629 + 0.5;
    float _1641 = _1621 * _1539;
    float _1643 = _1611 + 0.5;
    float _1645 = -_610;
    float _1647 = fma(_606, _1489, _1645);
    float _1649 = -_1591;
    float _1651 = _818 * _1649;
    float _1653 = -_1537;
    float _1655 = _818 * _1653;
    float _1657 = _1625 * _1539;
    out.m_71.x = _1635;
    out.m_71.y = _1633;
    out.m_71.z = _1637;
    out.m_71.w = _1639;
    float _1659 = fma(_836, _1567, _1651);
    float _1661 = fma(_836, _1533, _1655);
    float _1663 = _828 * _1591;
    float _1665 = _828 * _1537;
    float _1667 = -_1657;
    float _1669 = _818 * _1667;
    float _1671 = _828 * _1657;
    float _1673 = _846 * _1657;
    float _1675 = _1647 + 0.5;
    float _1677 = fma(_836, _1641, _1669);
    float _1679 = _846 * _1537;
    float _1681 = fma(_862, _1641, _1673);
    float _1683 = _846 * _1591;
    out.m_73.x = _1643;
    out.m_73.y = _1675;
    float _1685 = fma(_844, _1567, _1663);
    float _1687 = fma(_844, _1533, _1665);
    float _1689 = fma(_844, _1641, _1671);
    float _1691 = fma(_862, _1533, _1679);
    float _1693 = -_1585;
    float _1695 = fma(_850, _1693, _1685);
    float _1697 = -_1535;
    float _1699 = fma(_850, _1697, _1687);
    float _1701 = -_1535;
    float _1703 = fma(_858, _1701, _1661);
    float _1705 = -_1631;
    float _1707 = fma(_858, _1705, _1677);
    float _1709 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1715 = -_1631;
    float _1717 = fma(_850, _1715, _1689);
    float _1719 = -_1631;
    float _1721 = fma(_872, _1719, _1681);
    float _1723 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1725 = _1214 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1727 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1729 = _1699 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1731 = fma(_862, _1567, _1683);
    float _1733 = -_1585;
    float _1735 = fma(_858, _1733, _1659);
    float _1737 = -_1535;
    float _1739 = fma(_872, _1737, _1691);
    float _1741 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1723);
    float _1743 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1725);
    float _1745 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1727);
    float _1747 = fma(_1703, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1729);
    float _1749 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1751 = -_1585;
    float _1753 = fma(_872, _1751, _1731);
    float _1755 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1709);
    float _1757 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1759 = _1717 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1761 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1763 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1741);
    float _1765 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1749);
    float _1767 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1745);
    float _1769 = fma(_1739, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1747);
    float _1771 = _1250 * 0.5;
    float _1773 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1761);
    float _1775 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1765);
    float _1777 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1711);
    float _1779 = fma(_1280, -0.5, _1771);
    float _1781 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1757);
    float _1783 = fma(_1707, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1759);
    float _1785 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1755);
    float _1787 = fma(_1735, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1713);
    float _1789 = _1773 + _1250;
    float _1791 = _1278 + _1250;
    float _1793 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1781);
    float _1795 = fma(_1721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1783);
    float _1797 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1777);
    float _1799 = _1789 * 0.5;
    float _1801 = _1791 * 0.5;
    float _1803 = fma(_1753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1787);
    out.m_75.x = _1793;
    out.m_75.y = _1775;
    out.m_75.z = _1795;
    bool _1805 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1024);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    out.m_77.x = _1801;
    out.m_77.y = _1779;
    out.m_77.z = _1799;
    out.m_77.w = _1250;
    out.m_79.x = _1785;
    out.m_79.y = _1797;
    out.m_79.z = _1803;
    out.m_81.x = _1763;
    out.m_81.y = _1767;
    out.m_81.z = _1769;
    out.gl_Position.x = _1278;
    out.gl_Position.y = _1280;
    out.gl_Position.z = _1773;
    out.gl_Position.w = _1250;
    float _1815 = _1769;
    float _1817 = _1767;
    float _1819 = _1763;
    if (!_1813)
    {
        _1815 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1821 = _1815;
    float _1823 = _1821;
    float _1825 = _1821;
    if (!_1813)
    {
        _1817 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1827;
    if (!_1813)
    {
        _1819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1833 = _1819;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1813)
    {
        _1421 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1839 = _1421;
    float _1841 = _1839;
    float _1843 = _1839;
    if (!_1813)
    {
        _1423 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1845 = _1423;
    float _1847 = _1519 * _1312;
    float _1849 = -_1519;
    float _1851 = _1849 + 1.0;
    float _1853 = _1327 * _1847;
    float _1855 = _1327 * _1851;
    float _1857 = _1337 * _1847;
    float _1859 = fma(_1333, _1853, _1321);
    float _1861 = fma(_1335, _1853, _1323);
    float _1863 = _1853;
    float _1865 = _1845;
    float _1867 = _1845;
    if (!_1813)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1869 = _1863;
    float _1871 = fma(_1327, _1857, _1325);
    out.m_83.x = _1859;
    out.m_83.y = _1861;
    out.m_83.z = _1871;
    out.m_83.w = _1855;
    bool _1873 = !_1813;
    float _1875 = _1869;
    float _1877 = _1869;
    if (!_1873)
    {
        bool _1879 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1881 = isnan(_1024);
        bool _1883 = _1879 || _1881;
        bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1887 = _1883 || _1885;
        if (!_1887)
        {
            float _1889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1891 = _1024 + _1889;
            float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1893;
            float _1897 = 1.0 / _1895;
            float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1903 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1905 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1909 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1913 = _1911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1917 = _1915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1919 = _1891 * _1897;
            float _1921 = precise::clamp(_1919, 0.0, 1.0);
            float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1925 = _1923 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1927 = fma(_1921, _1905, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1929 = fma(_1921, _1925, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1931 = fma(_1921, _1901, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1933 = fma(_1921, _1909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1935 = fma(_1921, _1913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1937 = fma(_1921, _1917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1831 = _1931;
            _1867 = _1935;
            _1825 = _1929;
            _1843 = _1933;
            _1837 = _1927;
            _1877 = _1937;
            _1939 = true;
        }
        else
        {
            bool _1941 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1943 = isnan(_1024);
            bool _1945 = _1941 || _1943;
            bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1949 = _1945 || _1947;
            if (!_1949)
            {
                _1841 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1951 = _1841;
            _1843 = _1951;
            if (!_1949)
            {
                _1865 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1953 = _1865;
            _1867 = _1953;
            if (!_1949)
            {
                _1875 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1955 = _1875;
            _1877 = _1955;
            if (!_1949)
            {
                _1823 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1957 = _1823;
            _1825 = _1957;
            if (!_1949)
            {
                _1829 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1959 = _1829;
            _1831 = _1959;
            if (!_1949)
            {
                _1835 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1961 = _1835;
            bool _1963 = !_1949;
            _1837 = _1961;
            if (!_1963)
            {
                bool _1965 = _1024 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1967 = isnan(_1024);
                bool _1969 = _1965 || _1967;
                bool _1971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1973 = _1969 || _1971;
                if (!_1973)
                {
                    float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1977 = _1024 + _1975;
                    float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1979;
                    float _1983 = 1.0 / _1981;
                    float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2005 = _1977 * _1983;
                    float _2007 = precise::clamp(_2005, 0.0, 1.0);
                    float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2013 = fma(_2007, _1991, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2015 = fma(_2007, _2011, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2017 = fma(_2007, _1987, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2019 = fma(_2007, _1995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2021 = fma(_2007, _1999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2023 = fma(_2007, _2003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1831 = _2017;
                    _1867 = _2021;
                    _1825 = _2015;
                    _1843 = _2019;
                    _1837 = _2013;
                    _1877 = _2023;
                    _1939 = true;
                }
                else
                {
                    _1831 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1867 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1825 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1843 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1837 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1877 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1939 = false;
    float _2025 = _1831;
    float _2027 = _1867;
    float _2029 = _1825;
    float _2031 = _1843;
    float _2033 = _1837;
    float _2035 = _1877;
    float _2037 = fma(_1797, -0.5, 0.5);
    float _2039 = precise::clamp(_2037, 0.0, 1.0);
    float _2041 = -_2025;
    float _2043 = _2027 + _2041;
    float _2045 = -_2029;
    float _2047 = _2031 + _2045;
    float _2049 = -_2033;
    float _2051 = _2035 + _2049;
    bool _2053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2055 = fma(_2039, _2043, _2025);
    float _2057 = fma(_2039, _2047, _2029);
    float _2059 = fma(_2039, _2051, _2033);
    float _2061 = _2055 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2063 = fma(_2057, 0.298911988735198974609375, _2061);
    float _2065 = fma(_2059, 0.114477999508380889892578125, _2063);
    out.m_85.x = 0.0;
    float _2067 = -_2065;
    float _2069 = _2057 + _2067;
    float _2071 = -_2065;
    float _2073 = _2055 + _2071;
    float _2075 = -_2065;
    float _2077 = _2059 + _2075;
    float _2079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2081 = fma(_2069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2083 = fma(_2073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    float _2085 = fma(_2077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2065);
    out.m_87.w = _2079;
    out.m_89.x = _2081;
    out.m_89.y = _2083;
    out.m_89.z = _2085;
    if (!_2053)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2087 = -_994;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2091 = -_998;
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2095 = -_1002;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = sqrt(_2103);
    float _2107 = rsqrt(_2103);
    float _2109 = -_2105;
    float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2113 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2115 = precise::clamp(_2113, 0.0, 1.0);
    float _2117 = _2093 * _2107;
    float _2119 = _2089 * _2107;
    float _2121 = abs(_2115);
    float _2123 = log2(_2121);
    float _2125 = _2097 * _2107;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2129 = _1797 * _2119;
    float _2131 = -_2119;
    float _2133 = -_2127;
    float _2135 = fma(_2131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2133);
    float _2137 = fma(_1785, _2117, _2129);
    float _2139 = -_2125;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2135);
    float _2143 = fma(_1803, _2125, _2137);
    float _2145 = precise::clamp(_2143, 0.0, 1.0);
    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2149 = _2141 + _2147;
    float _2151 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2153 = _2149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2155 = precise::clamp(_2153, 0.0, 1.0);
    float _2157 = exp2(_2151);
    float _2159 = _2157 * _2155;
    float _2161 = _2145 * _2159;
    float _2163 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2165 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2167 = _2161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2163;
    out.m_85.y = _2165;
    out.m_85.z = _2167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

