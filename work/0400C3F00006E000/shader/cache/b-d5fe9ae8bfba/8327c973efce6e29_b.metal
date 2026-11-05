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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    const device _35* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_2A [[id(9)]];
    sampler vp_t_tcb_2ASmplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_2ASmplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1896 = false;
    bool _678 = false;
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_130);
        out.gl_Position.z = _2262;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _150;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_166);
        out.gl_Position.z = _2331;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = in.m_64.x;
    float _178 = in.m_64.y;
    float _180 = in.m_64.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _184 = in.m_66.x;
    float _186 = in.m_66.y;
    float _188 = in.m_66.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = as_type<float>(int(gl_VertexIndex));
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_55.x;
    float _206 = in.m_55.y;
    float _208 = in.m_55.z;
    float _210 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = _168 * _168;
    float _218 = _170 * _170;
    float _220 = _172 * _172;
    float _222 = in.m_64.w;
    float _224 = fma(_176, _176, _216);
    float _226 = fma(_178, _178, _218);
    float _228 = fma(_180, _180, _220);
    float _230 = in.m_62.w;
    float _232 = fma(_184, _184, _224);
    float _234 = fma(_186, _186, _226);
    float _236 = fma(_188, _188, _228);
    float _238 = sqrt(_232);
    int _240 = as_type<int>(_196) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_196) & 2;
    bool _246 = _244 != 0;
    out.m_73.x = _200;
    out.m_73.y = _202;
    out.m_73.z = _210;
    float _248 = _178 * _206;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = in.m_75.x;
    float _256 = in.m_75.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _260 = _258 != 0;
    float _262 = sqrt(_234);
    bool _264 = !_242;
    float _266 = _264 ? (-0.5) : 0.5;
    float _268 = fma(_176, _204, _248);
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _170 * _206;
    bool _276 = _212 > 0.5;
    float _278 = fma(_180, _208, _268);
    bool _280 = _214 > 0.5;
    float _282 = sqrt(_236);
    bool _284 = _238 > 0.0;
    float _286 = fma(_168, _204, _274);
    float _288 = _186 * _206;
    float _290 = _278 + _222;
    float _292 = fma(_172, _208, _286);
    bool _294 = _262 > 0.0;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = in.m_66.w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _302 = fma(_184, _204, _288);
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = 0.0;
    float _308 = _204;
    float _310 = _168;
    float _312 = _170;
    if (_284)
    {
        float _314 = rsqrt(_232);
        _306 = _314;
    }
    float _316 = _306;
    float _318 = _300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _282 > 0.0;
    float _322 = _254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = _292 + _230;
    float _326 = fma(_188, _208, _302);
    float _328 = _256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_77.x = _304;
    out.m_77.y = _318;
    out.m_77.z = _194;
    float _330 = _222;
    float _332 = _328;
    float _334 = _282;
    if (_294)
    {
        float _336 = rsqrt(_234);
        _330 = _336;
    }
    float _338 = _330;
    float _340 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _266);
    float _344 = _324 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _346 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _348 = _236;
    float _350 = _342;
    float _352 = _340;
    if (_320)
    {
        float _354 = rsqrt(_236);
        _348 = _354;
    }
    float _356 = _348;
    float _358 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = _326 + _298;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _364 = _298;
    float _366 = _362;
    if (!_284)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_284)
    {
        float _372 = _316 * _176;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = _340 * _342;
    float _378 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _380 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    if (!_294)
    {
        _308 = 0.0;
        _350 = 0.0;
    }
    float _382 = _308;
    float _384 = _350;
    float _386 = _358 * _362;
    float _388 = _382;
    float _390 = _384;
    if (_294)
    {
        float _392 = _338 * _178;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _394;
    if (!_320)
    {
        _366 = 0.0;
    }
    float _398 = _366;
    float _400 = _360 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _402 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _380);
    float _404 = _398;
    if (_320)
    {
        float _406 = _356 * _180;
        _404 = _406;
    }
    float _408 = _404;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _412 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (_294)
    {
        float _414 = _338 * _186;
        _390 = _414;
    }
    float _416 = _390;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].x, _402);
    if (!_284)
    {
        _352 = 0.0;
        _332 = 0.0;
    }
    float _420 = _352;
    float _422 = _332;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _412);
    float _426 = _422;
    float _428 = _420;
    if (_284)
    {
        float _430 = _316 * _184;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = _418 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _436 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _438 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].y, _424);
    float _440 = -_272;
    int _442 = _280 ? as_type<int>(_440) : as_type<int>(_272);
    float _444 = _434 * _378;
    float _446 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _436);
    float _448 = _438 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _450 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _452 = fma(_444, 0.5, 0.5);
    float _454 = -_266;
    int _456 = _276 ? as_type<int>(_454) : as_type<int>(_266);
    float _458 = _448 * _410;
    bool _460 = !_260;
    float _462 = _460 ? _272 : as_type<float>(_442);
    float _464 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].z, _446);
    bool _466 = !_252;
    float _468 = _466 ? _266 : as_type<float>(_456);
    float _470 = fma(_458, 0.5, 0.5);
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _474 = -_462;
    float _476 = _474 + 0.5;
    float _478 = _464 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _480 = _468 + 0.5;
    float _482 = _448;
    if (_284)
    {
        float _484 = _316 * _168;
        _428 = _484;
    }
    float _486 = _428;
    float _488 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_294)
    {
        _310 = 0.0;
    }
    float _490 = _310;
    float _492 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _494 = floor(_470);
    float _496 = _478 * _450;
    float _498 = _490;
    if (_294)
    {
        float _500 = _338 * _170;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_320)
    {
        _312 = 0.0;
    }
    float _506 = _312;
    float _508 = _492 * _174;
    float _510 = _506;
    if (!_320)
    {
        _482 = 0.0;
    }
    float _512 = _482;
    float _514 = _512;
    if (_320)
    {
        float _516 = _356 * _188;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = floor(_452);
    float _522 = _488 * _472;
    float _524 = fma(_496, 0.5, 0.5);
    float _526 = _266 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _528 = _518;
    if (_320)
    {
        float _530 = _356 * _172;
        _514 = _530;
    }
    float _532 = _514;
    float _534 = _386 * _394;
    float _536 = _386 * _502;
    float _538 = _386 * _416;
    float _540 = _504 * _502;
    float _542 = -_494;
    float _544 = _470 + _542;
    float _546 = floor(_524);
    float _548 = _504 * _394;
    out.m_79.x = _508;
    out.m_79.y = _522;
    float _550 = _504 * _416;
    float _552 = fma(_376, _486, _536);
    float _554 = fma(_526, _486, _540);
    float _556 = -_520;
    float _558 = _452 + _556;
    float _560 = fma(_544, 2.0, -1.0);
    float _562 = fma(_376, _374, _534);
    float _564 = fma(_526, _374, _548);
    float _566 = fma(_526, _432, _550);
    float _568 = fma(_376, _432, _538);
    float _570 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _572 = fma(_558, 2.0, -1.0);
    float _574 = fma(_570, _532, _552);
    float _576 = _560 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _578 = fma(_570, _408, _562);
    float _580 = fma(_570, _518, _568);
    float _582 = _572 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _586 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _590 = -_546;
    float _592 = _524 + _590;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].x, _584);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].y, _586);
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].z, _588);
    float _600 = fma(_592, 2.0, -1.0);
    float _602 = _564 + _408;
    bool _604 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _606 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _608 = _604 || _606;
    bool _610 = isnan(1.0);
    bool _612 = _608 || _610;
    float _614 = _600 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].x, _594);
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].y, _596);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].z, _598);
    float _622 = _554 + _532;
    float _624 = _616 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _626 = _618 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _628 = _620 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _630 = _566 + _518;
    float _632 = _578 + _624;
    float _634 = _574 + _626;
    float _636 = _580 + _628;
    float _638 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _640 = _544;
    float _642 = _592;
    float _644 = _616;
    float _646 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _648 = _616;
    float _650 = _572;
    float _652 = _560;
    float _654 = _620;
    float _656 = _600;
    float _658 = _580;
    float _660 = _628;
    float _670;
    float _672;
    float _674;
    float _676;
    if (!_612)
    {
        bool _662 = _626 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _664 = !_662;
        _666 = _664;
        if (!_666)
        {
            float _668 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _670 = _668;
            _672 = 0.0;
            _674 = 0.0;
            _676 = 0.0;
            _678 = true;
        }
    }
    if ((!_678) || _666)
    {
        bool _714;
        if (!_666)
        {
            bool _680 = _626 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _682 = isnan(_626);
            bool _684 = _680 || _682;
            bool _686 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _688 = _684 || _686;
            bool _690 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _692 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _694 = !_688;
            bool _696 = _692 && _694;
            if (_696)
            {
                _638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _698 = _638;
            float _700 = _698;
            if (_696)
            {
                _640 = 0.0;
            }
            float _702 = _640;
            _672 = _702;
            if (_696)
            {
                _642 = 0.0;
            }
            float _704 = _642;
            _674 = _704;
            if (_696)
            {
                float _706 = _698 * 5.0;
                _700 = _706;
            }
            float _708 = _700;
            _646 = _708;
            _670 = _708;
            if (_696)
            {
                _644 = 0.0;
            }
            float _710 = _644;
            bool _712 = !_688;
            _714 = _712 && _690;
            _648 = _710;
            _676 = _710;
        }
        if ((!_714) || _666)
        {
            _666 = false;
            float _716 = _646;
            float _718 = _648;
            bool _720 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _722 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _724 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _726 = _574;
            float _728 = _718;
            _672 = _632;
            _674 = _634;
            if (_720)
            {
                float _730 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _726 = _730;
            }
            float _732 = _726;
            if (_720)
            {
                float _734 = abs(_572);
                float _736 = -_734;
                float _738 = _736 + 1.0;
                _650 = _738;
            }
            float _740 = _650;
            if (_722)
            {
                float _742 = abs(_560);
                float _744 = -_742;
                float _746 = _744 + 1.0;
                _652 = _746;
            }
            float _748 = _652;
            if (!_720)
            {
                _654 = 1.0;
            }
            float _750 = _654;
            float _752 = _750;
            if (_724)
            {
                float _754 = abs(_600);
                float _756 = -_754;
                float _758 = _756 + 1.0;
                _656 = _758;
            }
            float _760 = _656;
            if (!_722)
            {
                _658 = 1.0;
            }
            float _762 = _658;
            float _764 = _762;
            if (!_724)
            {
                _728 = 1.0;
            }
            float _766 = _728;
            float _768 = _566;
            float _770 = _766;
            if (_722)
            {
                float _772 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _768 = _772;
            }
            float _774 = _768;
            float _776 = _716;
            if (_724)
            {
                float _778 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _776 = _778;
            }
            float _780 = _776;
            if (_720)
            {
                float _782 = _740 * _732;
                float _784 = precise::clamp(_782, 0.0, 1.0);
                _752 = _784;
            }
            float _786 = _752;
            if (_722)
            {
                float _788 = _748 * _774;
                float _790 = precise::clamp(_788, 0.0, 1.0);
                _764 = _790;
            }
            float _792 = _764;
            float _794 = _786 * _792;
            if (_724)
            {
                float _796 = _760 * _780;
                float _798 = precise::clamp(_796, 0.0, 1.0);
                _770 = _798;
            }
            float _800 = _770;
            float _802 = _794 * _800;
            _670 = _636;
            _676 = _802;
        }
    }
    _678 = false;
    float _804 = _670;
    float _806 = _672;
    float _808 = _674;
    float _810 = _676;
    float _812 = fma(_624, 6.2500002968590706586837768554688e-05, 0.5);
    float _814 = fma(_628, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3360 = float2(_812, _814);
    float _816 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3360, float2(0.0), isnan(_3360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3360, float2(0.0), isnan(_3360)), level(0.0)).x;
    float _818 = in.m_81.w;
    float _820 = trunc(_818);
    int _822 = int(_820);
    int _824 = _822 << 5;
    uint _827 = uint(int(uint(_824) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_827)];
    float _829 = as_type<float>(_dmw0.x);
    int _831 = _824 + 4;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    float _835 = as_type<float>(_dmw0.y);
    int _837 = _824 + 8;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    float _841 = as_type<float>(_dmw0.z);
    int _843 = _824 + 12;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    float _847 = as_type<float>(_dmw0.w);
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _804 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _855 = _806 + _853;
    float _857 = _851 * _851;
    float _859 = fma(_855, _855, _857);
    float _861 = sqrt(_859);
    bool _863 = _861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _847 * 2.0;
    bool _867 = !_863;
    float _869 = _808;
    float _871 = _806;
    float _873 = _804;
    float _875 = _810;
    if (!_867)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _861 + _879;
        float _883 = rsqrt(_859);
        float _885 = _881 * _877;
        float _887 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _885 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _883 * _901;
        float _907 = fma(_893, _808, _903);
        float _909 = fma(_855, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_851, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _869 = _907;
        _871 = _909;
        _873 = _911;
    }
    float _913 = _869;
    float _915 = _871;
    float _917 = _873;
    float _919 = _829 * 2.0;
    float _921 = _841 * _865;
    float _923 = _829 * _829;
    float _925 = _835 * _835;
    float _927 = _835 * _865;
    float _929 = _829 * _865;
    float _931 = -_921;
    float _933 = fma(_835, _919, _931);
    float _935 = fma(_835, _919, _921);
    float _937 = _835 * 2.0;
    float _939 = fma(_923, -2.0, 1.0);
    float _941 = fma(_925, -2.0, 1.0);
    float _943 = fma(_841, _919, _927);
    float _945 = _626 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = -_927;
    float _949 = fma(_841, _919, _947);
    float _951 = _626 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = _816 * 2000.0;
    float _955 = -_929;
    float _957 = fma(_841, _937, _955);
    float _959 = _841 * _841;
    float _961 = fma(_841, _937, _929);
    float _963 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _965 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    bool _967 = _626 >= _953;
    bool _969 = isnan(_626);
    bool _971 = _967 || _969;
    bool _973 = isnan(_953);
    bool _975 = _971 || _973;
    float _977 = fma(_959, -2.0, _941);
    float _979 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _963);
    float _981 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _965);
    float _983 = fma(_959, -2.0, _939);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = fma(_925, -2.0, _939);
    float _991 = _987 + _985;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = 1.0 / _985;
    float _1005 = _987;
    float _1007 = _915;
    float _1009 = _917;
    float _1011 = _913;
    if (_975)
    {
        _1005 = _913;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (!_975)
    {
        _1015 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1017;
    if (!_975)
    {
        _1007 = 0.0;
    }
    float _1021 = _1007;
    float _1023 = -_626;
    float _1025 = _1023 + _1017;
    float _1027 = _1025;
    if (!_975)
    {
        _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1029 = _1019;
    float _1031 = -_624;
    float _1033 = _1031 + _1021;
    float _1035 = _1025 * _502;
    float _1037 = _1025 * _486;
    if (!_975)
    {
        float _1039 = _1029 * 5.0;
        _1009 = _1039;
    }
    float _1041 = _1009;
    float _1043 = _991 * _1003;
    float _1045 = _1043 * 0.5;
    float _1047 = fma(_1033, _394, _1035);
    float _1049 = -_628;
    float _1051 = _1049 + _1041;
    float _1053 = fma(_1033, _374, _1037);
    bool _1055 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    float _1065 = _1025 * _532;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1069 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1067);
    float _1071 = fma(_1051, _416, _1047);
    float _1073 = fma(_1051, _432, _1053);
    float _1075 = fma(_1033, _408, _1065);
    float _1077 = _1071 * _933;
    float _1079 = _1071 * _983;
    float _1081 = _1071 * _961;
    float _1083 = 1.0 / _1069;
    float _1085 = fma(_1051, _518, _1075);
    float _1087 = fma(_1073, _977, _1077);
    float _1089 = fma(_1073, _935, _1079);
    float _1091 = fma(_1073, _949, _1081);
    float _1093 = _1073;
    if (_1063)
    {
        _1011 = 1.0;
    }
    float _1095 = _1011;
    float _1097 = fma(_1085, _943, _1087);
    float _1099 = fma(_1085, _957, _1089);
    float _1101 = fma(_1085, _989, _1091);
    float _1103 = _624 + _1097;
    float _1105 = _626 + _1099;
    float _1107 = _628 + _1101;
    float _1109 = _1105;
    float _1111 = _1103;
    float _1113 = _1107;
    float _1115 = _1099;
    float _1117 = _1095;
    if (!_1001)
    {
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1121 = _626 + _1119;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1125 = _624 + _1123;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1129 = _1121 * _1121;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _628 + _1131;
        float _1135 = fma(_1125, _1125, _1129);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1133, _1133, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1099, _1149, _626);
        float _1153 = fma(_1097, _1149, _624);
        float _1155 = fma(_1101, _1149, _628);
        _1093 = _1137;
        _1109 = _1151;
        _1111 = _1153;
        _1113 = _1155;
    }
    float _1157 = _1093;
    float _1159 = _1109;
    float _1161 = _1111;
    float _1163 = _1113;
    float _1165 = _1157;
    if (_1063)
    {
        _1027 = 1.0;
    }
    float _1167 = _1027;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1171 = _1083 * _1169;
    float _1173 = _1167;
    if (!_1063)
    {
        float _1175 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1177 = _1175 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1177 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1181;
        float _1193 = _1185 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1189 * _1191;
        float _1199 = _1185 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = 1.0 / _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1209 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1207;
        float _1211 = 1.0 / _1209;
        float _1213 = _1201 * _1205;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = fma(_1171, _1213, _1215);
        float _1219 = _1217 * _1211;
        float _1221 = precise::clamp(_1219, 0.0, 1.0);
        _396 = _1217;
        _1165 = _1205;
        _1115 = _1191;
        _528 = _1185;
        _1117 = _1221;
    }
    float _1223 = _396;
    float _1225 = _1165;
    float _1227 = _1115;
    float _1229 = _528;
    float _1231 = _1117;
    float _1233 = _1225;
    float _1235 = _1223;
    float _1237 = _1227;
    float _1239 = _1229;
    if (!_1063)
    {
        float _1241 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1243 = _1241 * 0.15915493667125701904296875;
        float _1245 = _1243 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1243 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = 1.0 / _1247;
        float _1259 = _1251 * 6.283185482025146484375;
        float _1261 = cos(_1259);
        float _1263 = _1255 * _1257;
        float _1265 = _1251 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1275 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1273;
        float _1277 = 1.0 / _1275;
        float _1279 = _1267 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1283 = fma(_1171, _1279, _1281);
        float _1285 = _1283 * _1277;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = -_1287;
        float _1291 = _1289 + 1.0;
        _1233 = _1277;
        _1235 = _1257;
        _1237 = _1279;
        _1239 = _1271;
        _1173 = _1291;
    }
    float _1293 = _1233;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = _1173;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1159 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1161 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1163 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = fma(_1313, _1313, _1317);
    float _1323 = rsqrt(_1321);
    float _1325 = sqrt(_1321);
    float _1327 = _1309 * _1323;
    float _1329 = _1313 * _1323;
    float _1331 = _1305 * _1323;
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1343 + _1347;
    float _1351 = _1293;
    float _1353 = _1299;
    float _1355 = _1349;
    float _1357 = _1295;
    float _1359 = _1323;
    float _1361 = _1333;
    if (_1345)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1363;
    }
    float _1365 = _1351;
    if (_1345)
    {
        float _1367 = rsqrt(_1341);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1369;
    if (_1345)
    {
        float _1373 = _1349 * _1365;
        _1355 = _1373;
    }
    float _1375 = _1355;
    if (_1345)
    {
        float _1377 = _1375 * 0.15915493667125701904296875;
        _1357 = _1377;
    }
    float _1379 = _1357;
    float _1381 = _1365;
    if (_1345)
    {
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = precise::max(0.0, _1389);
    float _1393 = _1297;
    if (_1345)
    {
        float _1395 = _1379 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = -_1331;
    float _1403 = -_1391;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1403);
    float _1407 = _1405;
    if (_1345)
    {
        float _1409 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1409;
    }
    float _1411 = _1359;
    float _1413 = _1387;
    float _1415 = _1411;
    if (_1345)
    {
        float _1417 = fma(_1387, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    float _1423 = _1399;
    if (_1345)
    {
        float _1425 = _1399 + (-1.0);
        _1415 = _1425;
    }
    float _1427 = _1415;
    float _1429 = _1427;
    if (_1345)
    {
        float _1431 = _1369 * _1419;
        _334 = _1431;
    }
    float _1433 = _334;
    if (!_1345)
    {
        _1421 = _1337;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1345)
    {
        float _1439 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1439;
    }
    float _1441 = _1371;
    if (_1345)
    {
        float _1443 = _1333 * _1433;
        _1361 = _1443;
    }
    float _1445 = _1361;
    if (!_1345)
    {
        _1429 = _1335;
    }
    float _1447 = _1429;
    float _1449 = _1447;
    if (_1345)
    {
        float _1451 = _1335 * _1433;
        _1449 = _1451;
    }
    float _1453 = _1449;
    if (_1345)
    {
        float _1455 = fma(_1405, _1399, _1441);
        _1407 = _1455;
    }
    float _1457 = _1407;
    if (_1345)
    {
        float _1459 = _1445 * _1445;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1345)
    {
        _1423 = _1339;
    }
    float _1463 = _1423;
    float _1465 = _1463;
    if (_1345)
    {
        float _1467 = _1453 * _1453;
        _1465 = _1467;
    }
    float _1469 = _1465;
    float _1471 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1473 = fma(_1457, _1457, _1461);
    float _1475 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1471);
    float _1477 = _1473 + _1469;
    float _1479 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1483 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1481);
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1489 = rsqrt(_1477);
    float _1491 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1493 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1495 = -_1485;
    float _1497 = _1495 + 1.0;
    float _1499 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1491);
    float _1503 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1493);
    float _1505 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1509 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1513 = abs(_1497);
    float _1515 = log2(_1513);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1525 = _1489 * _1445;
    float _1527 = _1489 * _1453;
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1521);
    float _1531 = _1489 * _1457;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1537 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1529);
    float _1539 = -_1523;
    float _1541 = fma(_1539, _1319, 1.0);
    float _1543 = -_1533;
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1543);
    float _1547 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1549 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1537);
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1553 = -_1527;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1545);
    float _1557 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = log2(_1541);
    float _1561 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1547);
    float _1563 = fma(_1555, -0.5, 0.5);
    float _1565 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1567 = fma(_1555, 0.5, 0.5);
    float _1569 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1571 = _1531 + 1.0;
    float _1573 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1565);
    float _1575 = exp2(_1551);
    float _1577 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1569);
    float _1581 = 1.0 / _1549;
    float _1583 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1585 = _1559 * 0.693147182464599609375;
    float _1587 = fma(_1567, _1583, -0.212114393711090087890625);
    float _1589 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = sqrt(_1563);
    float _1593 = -_1531;
    float _1595 = fma(_1575, _1571, _1593);
    float _1597 = fma(_1567, _1587, 1.570728778839111328125);
    float _1599 = fma(_1595, 0.5, 0.5);
    float _1601 = _1577 * _1581;
    float _1603 = _1579 * _1581;
    float _1605 = fma(_1601, 0.5, 0.5);
    float _1607 = fma(_1603, -0.5, 0.5);
    float _1609 = _1591 * 0.636619746685028076171875;
    float3 _4582 = float3(_1605, _1607, _1589);
    float _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4582, float3(0.0), isnan(_4582)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4582, float3(0.0), isnan(_4582)), level(0.0)).x;
    float3 _4593 = float3(_1605, _1607, _1589);
    float4 _1614 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4593, float3(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4593, float3(0.0), isnan(_4593)), level(0.0)).xyzw;
    float _1616 = _1614.x;
    float _1618 = _1614.y;
    float _1620 = _1614.z;
    float _1622 = _1614.w;
    float _1624 = -_1597;
    float _1626 = fma(_1609, _1624, 1.0);
    float2 _4614 = float2(_1626, _1599);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4614, float2(0.0), isnan(_4614)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4614, float2(0.0), isnan(_4614)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _622 * _983;
    out.m_83.x = _1161;
    out.m_83.y = _1159;
    out.m_83.z = _1163;
    float _1640 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1642 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1650 = _1646 || _1648;
    float _1652 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1654 = _1549;
    float _1656 = _1579;
    if (!_975)
    {
        _875 = 0.0;
    }
    float _1658 = _875;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1660);
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1664);
    bool _1668 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1670 = isnan(_1325);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1676 = _1672 || _1674;
    float _1678 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1662);
    float _1680 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1666);
    float _1682 = _624 + _1678;
    float _1684 = _628 + _1680;
    if (_1650)
    {
        float _1686 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1652 = _1686;
    }
    float _1688 = _1652;
    float _1690 = _1688;
    if (!_1650)
    {
        _660 = 1.0;
    }
    float _1692 = _660;
    float _1694 = -_1682;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1698 = -_1684;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1702 = _1692;
    if (_1650)
    {
        float _1704 = precise::min(_1688, 20.0);
        _1690 = _1704;
    }
    float _1706 = _1690;
    float _1708 = precise::min(_1682, _1696);
    float _1710 = precise::min(_1684, _1700);
    float _1712 = _622 * _933;
    float _1714 = _1706;
    if (_1650)
    {
        float _1716 = 1.0 / _1706;
        _1714 = _1716;
    }
    float _1718 = _1714;
    float _1720 = _622 * _961;
    float _1722 = precise::min(_1708, _1710);
    float _1724 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1726 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = fma(_602, _977, _1712);
    float _1730 = fma(_602, _949, _1720);
    float _1732 = exp2(_1724);
    float _1734 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1736 = fma(_630, _943, _1728);
    float _1738 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1734);
    float _1740 = _1577;
    if (_1650)
    {
        float _1742 = _1722 * _1718;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        _1702 = _1744;
    }
    float _1746 = _1702;
    float _1748 = fma(_602, _935, _1638);
    float _1750 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1752 = _1658 * _1746;
    float _1754 = fma(_630, _957, _1748);
    float _1756 = fma(_630, _989, _1730);
    float _1758 = _1750 + _1549;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1549;
    float _1764 = _1758 * 0.5;
    float _1766 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1736;
    out.m_85.y = _1754;
    out.m_85.z = _1756;
    out.m_87.z = _1764;
    out.m_87.w = _1549;
    float _1768 = _1750;
    if (!_1676)
    {
        _1654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1770 = _1654;
    float _1772 = _1770;
    float _1774 = _1770;
    if (!_1676)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    float _1780 = _1776;
    if (!_1676)
    {
        _1656 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1782 = _1656;
    float _1784 = _1782;
    float _1786 = _1782;
    if (!_1676)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1788 = _1740;
    float _1790 = _1766 * _1611;
    float _1792 = -_1766;
    float _1794 = _1792 + 1.0;
    float _1796 = _1231 * _1301;
    float _1798 = _1622 * _1790;
    float _1800 = _1622 * _1794;
    float _1802 = _1752 * _1796;
    float _1804 = _1636 * _1790;
    float _1806 = fma(_1632, _1798, _1616);
    float _1808 = fma(_1634, _1798, _1618);
    float _1810 = _1616;
    float _1812 = _1802;
    float _1814 = _1788;
    float _1816 = _1788;
    if (!_1676)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1818 = _1810;
    float _1820 = fma(_1622, _1804, _1620);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = _1818;
    float _1826 = _1818;
    if (!_1676)
    {
        _1812 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1828 = _1812;
    out.m_89.x = _1806;
    out.m_89.y = _1808;
    out.m_89.z = _1820;
    out.m_89.w = _1800;
    bool _1830 = !_1676;
    float _1832 = _1828;
    float _1834 = _1828;
    if (!_1830)
    {
        bool _1836 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1838 = isnan(_1325);
        bool _1840 = _1836 || _1838;
        bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1844 = _1840 || _1842;
        if (!_1844)
        {
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = _1325 + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1852 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1858 = 1.0 / _1852;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1876 = _1848 * _1858;
            float _1878 = precise::clamp(_1876, 0.0, 1.0);
            float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1884 = fma(_1878, _1856, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1886 = fma(_1878, _1882, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1888 = fma(_1878, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1878, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1892 = fma(_1878, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1894 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1774 = _1888;
            _1816 = _1892;
            _1826 = _1884;
            _1786 = _1890;
            _1780 = _1886;
            _1834 = _1894;
            _1896 = true;
        }
        else
        {
            bool _1898 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1900 = isnan(_1325);
            bool _1902 = _1898 || _1900;
            bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1906 = _1902 || _1904;
            if (!_1906)
            {
                _1824 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1908 = _1824;
            _1826 = _1908;
            if (!_1906)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1910 = _1772;
            _1774 = _1910;
            if (!_1906)
            {
                _1778 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1912 = _1778;
            _1780 = _1912;
            if (!_1906)
            {
                _1784 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1914 = _1784;
            _1786 = _1914;
            if (!_1906)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1916 = _1814;
            _1816 = _1916;
            if (!_1906)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1918 = _1832;
            bool _1920 = !_1906;
            _1834 = _1918;
            if (!_1920)
            {
                bool _1922 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1924 = isnan(_1325);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1930 = _1926 || _1928;
                if (!_1930)
                {
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = _1325 + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1936;
                    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1942 = _1940 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1944 = 1.0 / _1938;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1962 = _1934 * _1944;
                    float _1964 = precise::clamp(_1962, 0.0, 1.0);
                    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1968 = _1966 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1970 = fma(_1964, _1942, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1972 = fma(_1964, _1968, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1974 = fma(_1964, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1964, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1978 = fma(_1964, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1980 = fma(_1964, _1960, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1774 = _1974;
                    _1816 = _1978;
                    _1826 = _1970;
                    _1786 = _1976;
                    _1780 = _1972;
                    _1834 = _1980;
                    _1896 = true;
                }
                else
                {
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1826 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1786 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1780 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1896 = false;
    float _1982 = _1774;
    float _1984 = _1816;
    float _1986 = _1826;
    float _1988 = _1786;
    float _1990 = _1780;
    float _1992 = _1834;
    float _1994 = fma(_1754, -0.5, 0.5);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = _1822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2004 = -_1986;
    float _2006 = _2004 + _1988;
    float _2008 = fma(_1996, _2000, _1982);
    out.m_91.x = 0.0;
    float _2010 = -_1990;
    float _2012 = _2010 + _1992;
    float _2014 = fma(_1996, _2006, _1986);
    float _2016 = _2008 * 0.586610972881317138671875;
    out.m_58.x = _2002;
    bool _2018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2020 = fma(_1996, _2012, _1990);
    float _2022 = fma(_2014, 0.298911988735198974609375, _2016);
    bool _2024 = _1231 > 0.0;
    bool _2026 = isnan(_1231);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    float _2034 = fma(_2020, 0.114477999508380889892578125, _2022);
    out.m_93.x = 0.0;
    bool _2036 = _1301 <= 0.0;
    bool _2038 = !_2032;
    bool _2040 = _2036 || _2038;
    float _2042 = -_2034;
    float _2044 = _2014 + _2042;
    float _2046 = -_2034;
    float _2048 = _2008 + _2046;
    float _2050 = -_2034;
    float _2052 = _2020 + _2050;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2056 = fma(_2048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2058 = fma(_2052, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    bool _2060 = !_2018;
    if (!_2060)
    {
        float _2062 = -_1159;
        float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2066 = -_1161;
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2070 = -_1163;
        float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2074 = _2064 * _2064;
        float _2076 = fma(_2068, _2068, _2074);
        float _2078 = fma(_2072, _2072, _2076);
        float _2080 = rsqrt(_2078);
        float _2082 = _2064 * _2080;
        float _2084 = _2068 * _2080;
        float _2086 = _2072 * _2080;
        float _2088 = sqrt(_2078);
        float _2090 = -_1331;
        float _2092 = _2090 + _2082;
        float _2094 = -_1327;
        float _2096 = _2094 + _2084;
        float _2098 = -_1329;
        float _2100 = _2098 + _2086;
        float _2102 = _2092 * _2092;
        float _2104 = fma(_2096, _2096, _2102);
        float _2106 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2108 = precise::clamp(_2106, 0.0, 1.0);
        float _2110 = fma(_2100, _2100, _2104);
        float _2112 = _2108 * _2108;
        float _2114 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2116 = -_2088;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2120 = _2112 + (-1.0);
        float _2122 = rsqrt(_2110);
        float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        float _2128 = -_2082;
        float _2130 = -_2114;
        float _2132 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2130);
        float _2134 = _1754 * _2082;
        float _2136 = -_2086;
        float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2132);
        float _2140 = fma(_1736, _2084, _2134);
        float _2142 = abs(_2126);
        float _2144 = log2(_2142);
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2148 = _2138 + _2146;
        float _2150 = fma(_1756, _2086, _2140);
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2156 = precise::clamp(_2154, 0.0, 1.0);
        float _2158 = _2092 * _2122;
        float _2160 = _2096 * _2122;
        float _2162 = _2100 * _2122;
        float _2164 = _1754 * _2158;
        float _2166 = fma(_1736, _2160, _2164);
        float _2168 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2170 = fma(_1756, _2162, _2166);
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = exp2(_2168);
        float _2176 = _2172 * _2172;
        float _2178 = fma(_2176, _2120, 1.0);
        float _2180 = _2178 * _2178;
        float _2182 = 1.0 / _2180;
        float _2184 = _2174 * _2156;
        float _2186 = _2152 * _2184;
        float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2190 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2192 = _2112 * _2182;
        float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2196 = _2186 * _2192;
        out.m_91.x = _2194;
        out.m_91.y = _2188;
        out.m_91.z = _2190;
        float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2200 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2202 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2198;
        out.m_93.y = _2200;
        out.m_93.z = _2202;
    }
    out.m_95.x = _2054;
    out.m_95.y = _2056;
    out.m_95.z = _2058;
    if (!_2040)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_58.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1896 = false;
    bool _678 = false;
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_130);
        out.gl_Position.z = _2262;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _150;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_166);
        out.gl_Position.z = _2331;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = in.m_64.x;
    float _178 = in.m_64.y;
    float _180 = in.m_64.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _184 = in.m_66.x;
    float _186 = in.m_66.y;
    float _188 = in.m_66.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = as_type<float>(int(gl_VertexIndex));
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_55.x;
    float _206 = in.m_55.y;
    float _208 = in.m_55.z;
    float _210 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = _168 * _168;
    float _218 = _170 * _170;
    float _220 = _172 * _172;
    float _222 = in.m_64.w;
    float _224 = fma(_176, _176, _216);
    float _226 = fma(_178, _178, _218);
    float _228 = fma(_180, _180, _220);
    float _230 = in.m_62.w;
    float _232 = fma(_184, _184, _224);
    float _234 = fma(_186, _186, _226);
    float _236 = fma(_188, _188, _228);
    float _238 = sqrt(_232);
    int _240 = as_type<int>(_196) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_196) & 2;
    bool _246 = _244 != 0;
    out.m_73.x = _200;
    out.m_73.y = _202;
    out.m_73.z = _210;
    float _248 = _178 * _206;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = in.m_75.x;
    float _256 = in.m_75.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _260 = _258 != 0;
    float _262 = sqrt(_234);
    bool _264 = !_242;
    float _266 = _264 ? (-0.5) : 0.5;
    float _268 = fma(_176, _204, _248);
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _170 * _206;
    bool _276 = _212 > 0.5;
    float _278 = fma(_180, _208, _268);
    bool _280 = _214 > 0.5;
    float _282 = sqrt(_236);
    bool _284 = _238 > 0.0;
    float _286 = fma(_168, _204, _274);
    float _288 = _186 * _206;
    float _290 = _278 + _222;
    float _292 = fma(_172, _208, _286);
    bool _294 = _262 > 0.0;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = in.m_66.w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _302 = fma(_184, _204, _288);
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = 0.0;
    float _308 = _204;
    float _310 = _168;
    float _312 = _170;
    if (_284)
    {
        float _314 = rsqrt(_232);
        _306 = _314;
    }
    float _316 = _306;
    float _318 = _300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _282 > 0.0;
    float _322 = _254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = _292 + _230;
    float _326 = fma(_188, _208, _302);
    float _328 = _256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_77.x = _304;
    out.m_77.y = _318;
    out.m_77.z = _194;
    float _330 = _222;
    float _332 = _328;
    float _334 = _282;
    if (_294)
    {
        float _336 = rsqrt(_234);
        _330 = _336;
    }
    float _338 = _330;
    float _340 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _266);
    float _344 = _324 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _346 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _348 = _236;
    float _350 = _342;
    float _352 = _340;
    if (_320)
    {
        float _354 = rsqrt(_236);
        _348 = _354;
    }
    float _356 = _348;
    float _358 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = _326 + _298;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _364 = _298;
    float _366 = _362;
    if (!_284)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_284)
    {
        float _372 = _316 * _176;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = _340 * _342;
    float _378 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _380 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    if (!_294)
    {
        _308 = 0.0;
        _350 = 0.0;
    }
    float _382 = _308;
    float _384 = _350;
    float _386 = _358 * _362;
    float _388 = _382;
    float _390 = _384;
    if (_294)
    {
        float _392 = _338 * _178;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _394;
    if (!_320)
    {
        _366 = 0.0;
    }
    float _398 = _366;
    float _400 = _360 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _402 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _380);
    float _404 = _398;
    if (_320)
    {
        float _406 = _356 * _180;
        _404 = _406;
    }
    float _408 = _404;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _412 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (_294)
    {
        float _414 = _338 * _186;
        _390 = _414;
    }
    float _416 = _390;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].x, _402);
    if (!_284)
    {
        _352 = 0.0;
        _332 = 0.0;
    }
    float _420 = _352;
    float _422 = _332;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _412);
    float _426 = _422;
    float _428 = _420;
    if (_284)
    {
        float _430 = _316 * _184;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = _418 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _436 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _438 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].y, _424);
    float _440 = -_272;
    int _442 = _280 ? as_type<int>(_440) : as_type<int>(_272);
    float _444 = _434 * _378;
    float _446 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _436);
    float _448 = _438 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _450 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _452 = fma(_444, 0.5, 0.5);
    float _454 = -_266;
    int _456 = _276 ? as_type<int>(_454) : as_type<int>(_266);
    float _458 = _448 * _410;
    bool _460 = !_260;
    float _462 = _460 ? _272 : as_type<float>(_442);
    float _464 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].z, _446);
    bool _466 = !_252;
    float _468 = _466 ? _266 : as_type<float>(_456);
    float _470 = fma(_458, 0.5, 0.5);
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _474 = -_462;
    float _476 = _474 + 0.5;
    float _478 = _464 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _480 = _468 + 0.5;
    float _482 = _448;
    if (_284)
    {
        float _484 = _316 * _168;
        _428 = _484;
    }
    float _486 = _428;
    float _488 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_294)
    {
        _310 = 0.0;
    }
    float _490 = _310;
    float _492 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _494 = floor(_470);
    float _496 = _478 * _450;
    float _498 = _490;
    if (_294)
    {
        float _500 = _338 * _170;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_320)
    {
        _312 = 0.0;
    }
    float _506 = _312;
    float _508 = _492 * _174;
    float _510 = _506;
    if (!_320)
    {
        _482 = 0.0;
    }
    float _512 = _482;
    float _514 = _512;
    if (_320)
    {
        float _516 = _356 * _188;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = floor(_452);
    float _522 = _488 * _472;
    float _524 = fma(_496, 0.5, 0.5);
    float _526 = _266 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _528 = _518;
    if (_320)
    {
        float _530 = _356 * _172;
        _514 = _530;
    }
    float _532 = _514;
    float _534 = _386 * _394;
    float _536 = _386 * _502;
    float _538 = _386 * _416;
    float _540 = _504 * _502;
    float _542 = -_494;
    float _544 = _470 + _542;
    float _546 = floor(_524);
    float _548 = _504 * _394;
    out.m_79.x = _508;
    out.m_79.y = _522;
    float _550 = _504 * _416;
    float _552 = fma(_376, _486, _536);
    float _554 = fma(_526, _486, _540);
    float _556 = -_520;
    float _558 = _452 + _556;
    float _560 = fma(_544, 2.0, -1.0);
    float _562 = fma(_376, _374, _534);
    float _564 = fma(_526, _374, _548);
    float _566 = fma(_526, _432, _550);
    float _568 = fma(_376, _432, _538);
    float _570 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _572 = fma(_558, 2.0, -1.0);
    float _574 = fma(_570, _532, _552);
    float _576 = _560 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _578 = fma(_570, _408, _562);
    float _580 = fma(_570, _518, _568);
    float _582 = _572 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _586 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _590 = -_546;
    float _592 = _524 + _590;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].x, _584);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].y, _586);
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].z, _588);
    float _600 = fma(_592, 2.0, -1.0);
    float _602 = _564 + _408;
    bool _604 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _606 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _608 = _604 || _606;
    bool _610 = isnan(1.0);
    bool _612 = _608 || _610;
    float _614 = _600 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].x, _594);
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].y, _596);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].z, _598);
    float _622 = _554 + _532;
    float _624 = _616 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _626 = _618 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _628 = _620 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _630 = _566 + _518;
    float _632 = _578 + _624;
    float _634 = _574 + _626;
    float _636 = _580 + _628;
    float _638 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _640 = _544;
    float _642 = _592;
    float _644 = _616;
    float _646 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _648 = _616;
    float _650 = _572;
    float _652 = _560;
    float _654 = _620;
    float _656 = _600;
    float _658 = _580;
    float _660 = _628;
    float _670;
    float _672;
    float _674;
    float _676;
    if (!_612)
    {
        bool _662 = _626 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _664 = !_662;
        _666 = _664;
        if (!_666)
        {
            float _668 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _670 = _668;
            _672 = 0.0;
            _674 = 0.0;
            _676 = 0.0;
            _678 = true;
        }
    }
    if ((!_678) || _666)
    {
        bool _714;
        if (!_666)
        {
            bool _680 = _626 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _682 = isnan(_626);
            bool _684 = _680 || _682;
            bool _686 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _688 = _684 || _686;
            bool _690 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _692 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _694 = !_688;
            bool _696 = _692 && _694;
            if (_696)
            {
                _638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _698 = _638;
            float _700 = _698;
            if (_696)
            {
                _640 = 0.0;
            }
            float _702 = _640;
            _672 = _702;
            if (_696)
            {
                _642 = 0.0;
            }
            float _704 = _642;
            _674 = _704;
            if (_696)
            {
                float _706 = _698 * 5.0;
                _700 = _706;
            }
            float _708 = _700;
            _646 = _708;
            _670 = _708;
            if (_696)
            {
                _644 = 0.0;
            }
            float _710 = _644;
            bool _712 = !_688;
            _714 = _712 && _690;
            _648 = _710;
            _676 = _710;
        }
        if ((!_714) || _666)
        {
            _666 = false;
            float _716 = _646;
            float _718 = _648;
            bool _720 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _722 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _724 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _726 = _574;
            float _728 = _718;
            _672 = _632;
            _674 = _634;
            if (_720)
            {
                float _730 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _726 = _730;
            }
            float _732 = _726;
            if (_720)
            {
                float _734 = abs(_572);
                float _736 = -_734;
                float _738 = _736 + 1.0;
                _650 = _738;
            }
            float _740 = _650;
            if (_722)
            {
                float _742 = abs(_560);
                float _744 = -_742;
                float _746 = _744 + 1.0;
                _652 = _746;
            }
            float _748 = _652;
            if (!_720)
            {
                _654 = 1.0;
            }
            float _750 = _654;
            float _752 = _750;
            if (_724)
            {
                float _754 = abs(_600);
                float _756 = -_754;
                float _758 = _756 + 1.0;
                _656 = _758;
            }
            float _760 = _656;
            if (!_722)
            {
                _658 = 1.0;
            }
            float _762 = _658;
            float _764 = _762;
            if (!_724)
            {
                _728 = 1.0;
            }
            float _766 = _728;
            float _768 = _566;
            float _770 = _766;
            if (_722)
            {
                float _772 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _768 = _772;
            }
            float _774 = _768;
            float _776 = _716;
            if (_724)
            {
                float _778 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _776 = _778;
            }
            float _780 = _776;
            if (_720)
            {
                float _782 = _740 * _732;
                float _784 = precise::clamp(_782, 0.0, 1.0);
                _752 = _784;
            }
            float _786 = _752;
            if (_722)
            {
                float _788 = _748 * _774;
                float _790 = precise::clamp(_788, 0.0, 1.0);
                _764 = _790;
            }
            float _792 = _764;
            float _794 = _786 * _792;
            if (_724)
            {
                float _796 = _760 * _780;
                float _798 = precise::clamp(_796, 0.0, 1.0);
                _770 = _798;
            }
            float _800 = _770;
            float _802 = _794 * _800;
            _670 = _636;
            _676 = _802;
        }
    }
    _678 = false;
    float _804 = _670;
    float _806 = _672;
    float _808 = _674;
    float _810 = _676;
    float _812 = fma(_624, 6.2500002968590706586837768554688e-05, 0.5);
    float _814 = fma(_628, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3360 = float2(_812, _814);
    float _816 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3360, float2(0.0), isnan(_3360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3360, float2(0.0), isnan(_3360)), level(0.0)).x;
    float _818 = in.m_81.w;
    float _820 = trunc(_818);
    int _822 = int(_820);
    int _824 = _822 << 5;
    uint _827 = uint(int(uint(_824) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_827)];
    float _829 = as_type<float>(_dmw0.x);
    int _831 = _824 + 4;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    float _835 = as_type<float>(_dmw0.y);
    int _837 = _824 + 8;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    float _841 = as_type<float>(_dmw0.z);
    int _843 = _824 + 12;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    float _847 = as_type<float>(_dmw0.w);
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _804 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _855 = _806 + _853;
    float _857 = _851 * _851;
    float _859 = fma(_855, _855, _857);
    float _861 = sqrt(_859);
    bool _863 = _861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _847 * 2.0;
    bool _867 = !_863;
    float _869 = _808;
    float _871 = _806;
    float _873 = _804;
    float _875 = _810;
    if (!_867)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _861 + _879;
        float _883 = rsqrt(_859);
        float _885 = _881 * _877;
        float _887 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _885 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _883 * _901;
        float _907 = fma(_893, _808, _903);
        float _909 = fma(_855, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_851, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _869 = _907;
        _871 = _909;
        _873 = _911;
    }
    float _913 = _869;
    float _915 = _871;
    float _917 = _873;
    float _919 = _829 * 2.0;
    float _921 = _841 * _865;
    float _923 = _829 * _829;
    float _925 = _835 * _835;
    float _927 = _835 * _865;
    float _929 = _829 * _865;
    float _931 = -_921;
    float _933 = fma(_835, _919, _931);
    float _935 = fma(_835, _919, _921);
    float _937 = _835 * 2.0;
    float _939 = fma(_923, -2.0, 1.0);
    float _941 = fma(_925, -2.0, 1.0);
    float _943 = fma(_841, _919, _927);
    float _945 = _626 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = -_927;
    float _949 = fma(_841, _919, _947);
    float _951 = _626 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = _816 * 2000.0;
    float _955 = -_929;
    float _957 = fma(_841, _937, _955);
    float _959 = _841 * _841;
    float _961 = fma(_841, _937, _929);
    float _963 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _965 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    bool _967 = _626 >= _953;
    bool _969 = isnan(_626);
    bool _971 = _967 || _969;
    bool _973 = isnan(_953);
    bool _975 = _971 || _973;
    float _977 = fma(_959, -2.0, _941);
    float _979 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _963);
    float _981 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _965);
    float _983 = fma(_959, -2.0, _939);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = fma(_925, -2.0, _939);
    float _991 = _987 + _985;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = 1.0 / _985;
    float _1005 = _987;
    float _1007 = _915;
    float _1009 = _917;
    float _1011 = _913;
    if (_975)
    {
        _1005 = _913;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (!_975)
    {
        _1015 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1017;
    if (!_975)
    {
        _1007 = 0.0;
    }
    float _1021 = _1007;
    float _1023 = -_626;
    float _1025 = _1023 + _1017;
    float _1027 = _1025;
    if (!_975)
    {
        _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1029 = _1019;
    float _1031 = -_624;
    float _1033 = _1031 + _1021;
    float _1035 = _1025 * _502;
    float _1037 = _1025 * _486;
    if (!_975)
    {
        float _1039 = _1029 * 5.0;
        _1009 = _1039;
    }
    float _1041 = _1009;
    float _1043 = _991 * _1003;
    float _1045 = _1043 * 0.5;
    float _1047 = fma(_1033, _394, _1035);
    float _1049 = -_628;
    float _1051 = _1049 + _1041;
    float _1053 = fma(_1033, _374, _1037);
    bool _1055 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    float _1065 = _1025 * _532;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1069 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1067);
    float _1071 = fma(_1051, _416, _1047);
    float _1073 = fma(_1051, _432, _1053);
    float _1075 = fma(_1033, _408, _1065);
    float _1077 = _1071 * _933;
    float _1079 = _1071 * _983;
    float _1081 = _1071 * _961;
    float _1083 = 1.0 / _1069;
    float _1085 = fma(_1051, _518, _1075);
    float _1087 = fma(_1073, _977, _1077);
    float _1089 = fma(_1073, _935, _1079);
    float _1091 = fma(_1073, _949, _1081);
    float _1093 = _1073;
    if (_1063)
    {
        _1011 = 1.0;
    }
    float _1095 = _1011;
    float _1097 = fma(_1085, _943, _1087);
    float _1099 = fma(_1085, _957, _1089);
    float _1101 = fma(_1085, _989, _1091);
    float _1103 = _624 + _1097;
    float _1105 = _626 + _1099;
    float _1107 = _628 + _1101;
    float _1109 = _1105;
    float _1111 = _1103;
    float _1113 = _1107;
    float _1115 = _1099;
    float _1117 = _1095;
    if (!_1001)
    {
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1121 = _626 + _1119;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1125 = _624 + _1123;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1129 = _1121 * _1121;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _628 + _1131;
        float _1135 = fma(_1125, _1125, _1129);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1133, _1133, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1099, _1149, _626);
        float _1153 = fma(_1097, _1149, _624);
        float _1155 = fma(_1101, _1149, _628);
        _1093 = _1137;
        _1109 = _1151;
        _1111 = _1153;
        _1113 = _1155;
    }
    float _1157 = _1093;
    float _1159 = _1109;
    float _1161 = _1111;
    float _1163 = _1113;
    float _1165 = _1157;
    if (_1063)
    {
        _1027 = 1.0;
    }
    float _1167 = _1027;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1171 = _1083 * _1169;
    float _1173 = _1167;
    if (!_1063)
    {
        float _1175 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1177 = _1175 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1177 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1181;
        float _1193 = _1185 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1189 * _1191;
        float _1199 = _1185 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = 1.0 / _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1209 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1207;
        float _1211 = 1.0 / _1209;
        float _1213 = _1201 * _1205;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = fma(_1171, _1213, _1215);
        float _1219 = _1217 * _1211;
        float _1221 = precise::clamp(_1219, 0.0, 1.0);
        _396 = _1217;
        _1165 = _1205;
        _1115 = _1191;
        _528 = _1185;
        _1117 = _1221;
    }
    float _1223 = _396;
    float _1225 = _1165;
    float _1227 = _1115;
    float _1229 = _528;
    float _1231 = _1117;
    float _1233 = _1225;
    float _1235 = _1223;
    float _1237 = _1227;
    float _1239 = _1229;
    if (!_1063)
    {
        float _1241 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1243 = _1241 * 0.15915493667125701904296875;
        float _1245 = _1243 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1243 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = 1.0 / _1247;
        float _1259 = _1251 * 6.283185482025146484375;
        float _1261 = cos(_1259);
        float _1263 = _1255 * _1257;
        float _1265 = _1251 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1275 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1273;
        float _1277 = 1.0 / _1275;
        float _1279 = _1267 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1283 = fma(_1171, _1279, _1281);
        float _1285 = _1283 * _1277;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = -_1287;
        float _1291 = _1289 + 1.0;
        _1233 = _1277;
        _1235 = _1257;
        _1237 = _1279;
        _1239 = _1271;
        _1173 = _1291;
    }
    float _1293 = _1233;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = _1173;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1159 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1161 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1163 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = fma(_1313, _1313, _1317);
    float _1323 = rsqrt(_1321);
    float _1325 = sqrt(_1321);
    float _1327 = _1309 * _1323;
    float _1329 = _1313 * _1323;
    float _1331 = _1305 * _1323;
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1343 + _1347;
    float _1351 = _1293;
    float _1353 = _1299;
    float _1355 = _1349;
    float _1357 = _1295;
    float _1359 = _1323;
    float _1361 = _1333;
    if (_1345)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1363;
    }
    float _1365 = _1351;
    if (_1345)
    {
        float _1367 = rsqrt(_1341);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1369;
    if (_1345)
    {
        float _1373 = _1349 * _1365;
        _1355 = _1373;
    }
    float _1375 = _1355;
    if (_1345)
    {
        float _1377 = _1375 * 0.15915493667125701904296875;
        _1357 = _1377;
    }
    float _1379 = _1357;
    float _1381 = _1365;
    if (_1345)
    {
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = precise::max(0.0, _1389);
    float _1393 = _1297;
    if (_1345)
    {
        float _1395 = _1379 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = -_1331;
    float _1403 = -_1391;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1403);
    float _1407 = _1405;
    if (_1345)
    {
        float _1409 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1409;
    }
    float _1411 = _1359;
    float _1413 = _1387;
    float _1415 = _1411;
    if (_1345)
    {
        float _1417 = fma(_1387, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    float _1423 = _1399;
    if (_1345)
    {
        float _1425 = _1399 + (-1.0);
        _1415 = _1425;
    }
    float _1427 = _1415;
    float _1429 = _1427;
    if (_1345)
    {
        float _1431 = _1369 * _1419;
        _334 = _1431;
    }
    float _1433 = _334;
    if (!_1345)
    {
        _1421 = _1337;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1345)
    {
        float _1439 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1439;
    }
    float _1441 = _1371;
    if (_1345)
    {
        float _1443 = _1333 * _1433;
        _1361 = _1443;
    }
    float _1445 = _1361;
    if (!_1345)
    {
        _1429 = _1335;
    }
    float _1447 = _1429;
    float _1449 = _1447;
    if (_1345)
    {
        float _1451 = _1335 * _1433;
        _1449 = _1451;
    }
    float _1453 = _1449;
    if (_1345)
    {
        float _1455 = fma(_1405, _1399, _1441);
        _1407 = _1455;
    }
    float _1457 = _1407;
    if (_1345)
    {
        float _1459 = _1445 * _1445;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1345)
    {
        _1423 = _1339;
    }
    float _1463 = _1423;
    float _1465 = _1463;
    if (_1345)
    {
        float _1467 = _1453 * _1453;
        _1465 = _1467;
    }
    float _1469 = _1465;
    float _1471 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1473 = fma(_1457, _1457, _1461);
    float _1475 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1471);
    float _1477 = _1473 + _1469;
    float _1479 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1483 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1481);
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1489 = rsqrt(_1477);
    float _1491 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1493 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1495 = -_1485;
    float _1497 = _1495 + 1.0;
    float _1499 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1491);
    float _1503 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1493);
    float _1505 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1509 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1513 = abs(_1497);
    float _1515 = log2(_1513);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1525 = _1489 * _1445;
    float _1527 = _1489 * _1453;
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1521);
    float _1531 = _1489 * _1457;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1537 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1529);
    float _1539 = -_1523;
    float _1541 = fma(_1539, _1319, 1.0);
    float _1543 = -_1533;
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1543);
    float _1547 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1549 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1537);
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1553 = -_1527;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1545);
    float _1557 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = log2(_1541);
    float _1561 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1547);
    float _1563 = fma(_1555, -0.5, 0.5);
    float _1565 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1567 = fma(_1555, 0.5, 0.5);
    float _1569 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1571 = _1531 + 1.0;
    float _1573 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1565);
    float _1575 = exp2(_1551);
    float _1577 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1569);
    float _1581 = 1.0 / _1549;
    float _1583 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1585 = _1559 * 0.693147182464599609375;
    float _1587 = fma(_1567, _1583, -0.212114393711090087890625);
    float _1589 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = sqrt(_1563);
    float _1593 = -_1531;
    float _1595 = fma(_1575, _1571, _1593);
    float _1597 = fma(_1567, _1587, 1.570728778839111328125);
    float _1599 = fma(_1595, 0.5, 0.5);
    float _1601 = _1577 * _1581;
    float _1603 = _1579 * _1581;
    float _1605 = fma(_1601, 0.5, 0.5);
    float _1607 = fma(_1603, -0.5, 0.5);
    float _1609 = _1591 * 0.636619746685028076171875;
    float3 _4582 = float3(_1605, _1607, _1589);
    float _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4582, float3(0.0), isnan(_4582)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4582, float3(0.0), isnan(_4582)), level(0.0)).x;
    float3 _4593 = float3(_1605, _1607, _1589);
    float4 _1614 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4593, float3(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4593, float3(0.0), isnan(_4593)), level(0.0)).xyzw;
    float _1616 = _1614.x;
    float _1618 = _1614.y;
    float _1620 = _1614.z;
    float _1622 = _1614.w;
    float _1624 = -_1597;
    float _1626 = fma(_1609, _1624, 1.0);
    float2 _4614 = float2(_1626, _1599);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4614, float2(0.0), isnan(_4614)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4614, float2(0.0), isnan(_4614)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _622 * _983;
    out.m_83.x = _1161;
    out.m_83.y = _1159;
    out.m_83.z = _1163;
    float _1640 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1642 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1650 = _1646 || _1648;
    float _1652 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1654 = _1549;
    float _1656 = _1579;
    if (!_975)
    {
        _875 = 0.0;
    }
    float _1658 = _875;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1660);
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1664);
    bool _1668 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1670 = isnan(_1325);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1676 = _1672 || _1674;
    float _1678 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1662);
    float _1680 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1666);
    float _1682 = _624 + _1678;
    float _1684 = _628 + _1680;
    if (_1650)
    {
        float _1686 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1652 = _1686;
    }
    float _1688 = _1652;
    float _1690 = _1688;
    if (!_1650)
    {
        _660 = 1.0;
    }
    float _1692 = _660;
    float _1694 = -_1682;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1698 = -_1684;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1702 = _1692;
    if (_1650)
    {
        float _1704 = precise::min(_1688, 20.0);
        _1690 = _1704;
    }
    float _1706 = _1690;
    float _1708 = precise::min(_1682, _1696);
    float _1710 = precise::min(_1684, _1700);
    float _1712 = _622 * _933;
    float _1714 = _1706;
    if (_1650)
    {
        float _1716 = 1.0 / _1706;
        _1714 = _1716;
    }
    float _1718 = _1714;
    float _1720 = _622 * _961;
    float _1722 = precise::min(_1708, _1710);
    float _1724 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1726 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = fma(_602, _977, _1712);
    float _1730 = fma(_602, _949, _1720);
    float _1732 = exp2(_1724);
    float _1734 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1736 = fma(_630, _943, _1728);
    float _1738 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1734);
    float _1740 = _1577;
    if (_1650)
    {
        float _1742 = _1722 * _1718;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        _1702 = _1744;
    }
    float _1746 = _1702;
    float _1748 = fma(_602, _935, _1638);
    float _1750 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1752 = _1658 * _1746;
    float _1754 = fma(_630, _957, _1748);
    float _1756 = fma(_630, _989, _1730);
    float _1758 = _1750 + _1549;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1549;
    float _1764 = _1758 * 0.5;
    float _1766 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1736;
    out.m_85.y = _1754;
    out.m_85.z = _1756;
    out.m_87.z = _1764;
    out.m_87.w = _1549;
    float _1768 = _1750;
    if (!_1676)
    {
        _1654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1770 = _1654;
    float _1772 = _1770;
    float _1774 = _1770;
    if (!_1676)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    float _1780 = _1776;
    if (!_1676)
    {
        _1656 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1782 = _1656;
    float _1784 = _1782;
    float _1786 = _1782;
    if (!_1676)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1788 = _1740;
    float _1790 = _1766 * _1611;
    float _1792 = -_1766;
    float _1794 = _1792 + 1.0;
    float _1796 = _1231 * _1301;
    float _1798 = _1622 * _1790;
    float _1800 = _1622 * _1794;
    float _1802 = _1752 * _1796;
    float _1804 = _1636 * _1790;
    float _1806 = fma(_1632, _1798, _1616);
    float _1808 = fma(_1634, _1798, _1618);
    float _1810 = _1616;
    float _1812 = _1802;
    float _1814 = _1788;
    float _1816 = _1788;
    if (!_1676)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1818 = _1810;
    float _1820 = fma(_1622, _1804, _1620);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = _1818;
    float _1826 = _1818;
    if (!_1676)
    {
        _1812 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1828 = _1812;
    out.m_89.x = _1806;
    out.m_89.y = _1808;
    out.m_89.z = _1820;
    out.m_89.w = _1800;
    bool _1830 = !_1676;
    float _1832 = _1828;
    float _1834 = _1828;
    if (!_1830)
    {
        bool _1836 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1838 = isnan(_1325);
        bool _1840 = _1836 || _1838;
        bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1844 = _1840 || _1842;
        if (!_1844)
        {
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = _1325 + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1852 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1858 = 1.0 / _1852;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1876 = _1848 * _1858;
            float _1878 = precise::clamp(_1876, 0.0, 1.0);
            float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1884 = fma(_1878, _1856, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1886 = fma(_1878, _1882, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1888 = fma(_1878, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1878, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1892 = fma(_1878, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1894 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1774 = _1888;
            _1816 = _1892;
            _1826 = _1884;
            _1786 = _1890;
            _1780 = _1886;
            _1834 = _1894;
            _1896 = true;
        }
        else
        {
            bool _1898 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1900 = isnan(_1325);
            bool _1902 = _1898 || _1900;
            bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1906 = _1902 || _1904;
            if (!_1906)
            {
                _1824 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1908 = _1824;
            _1826 = _1908;
            if (!_1906)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1910 = _1772;
            _1774 = _1910;
            if (!_1906)
            {
                _1778 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1912 = _1778;
            _1780 = _1912;
            if (!_1906)
            {
                _1784 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1914 = _1784;
            _1786 = _1914;
            if (!_1906)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1916 = _1814;
            _1816 = _1916;
            if (!_1906)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1918 = _1832;
            bool _1920 = !_1906;
            _1834 = _1918;
            if (!_1920)
            {
                bool _1922 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1924 = isnan(_1325);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1930 = _1926 || _1928;
                if (!_1930)
                {
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = _1325 + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1936;
                    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1942 = _1940 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1944 = 1.0 / _1938;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1962 = _1934 * _1944;
                    float _1964 = precise::clamp(_1962, 0.0, 1.0);
                    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1968 = _1966 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1970 = fma(_1964, _1942, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1972 = fma(_1964, _1968, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1974 = fma(_1964, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1964, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1978 = fma(_1964, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1980 = fma(_1964, _1960, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1774 = _1974;
                    _1816 = _1978;
                    _1826 = _1970;
                    _1786 = _1976;
                    _1780 = _1972;
                    _1834 = _1980;
                    _1896 = true;
                }
                else
                {
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1826 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1786 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1780 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1896 = false;
    float _1982 = _1774;
    float _1984 = _1816;
    float _1986 = _1826;
    float _1988 = _1786;
    float _1990 = _1780;
    float _1992 = _1834;
    float _1994 = fma(_1754, -0.5, 0.5);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = _1822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2004 = -_1986;
    float _2006 = _2004 + _1988;
    float _2008 = fma(_1996, _2000, _1982);
    out.m_91.x = 0.0;
    float _2010 = -_1990;
    float _2012 = _2010 + _1992;
    float _2014 = fma(_1996, _2006, _1986);
    float _2016 = _2008 * 0.586610972881317138671875;
    out.m_58.x = _2002;
    bool _2018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2020 = fma(_1996, _2012, _1990);
    float _2022 = fma(_2014, 0.298911988735198974609375, _2016);
    bool _2024 = _1231 > 0.0;
    bool _2026 = isnan(_1231);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    float _2034 = fma(_2020, 0.114477999508380889892578125, _2022);
    out.m_93.x = 0.0;
    bool _2036 = _1301 <= 0.0;
    bool _2038 = !_2032;
    bool _2040 = _2036 || _2038;
    float _2042 = -_2034;
    float _2044 = _2014 + _2042;
    float _2046 = -_2034;
    float _2048 = _2008 + _2046;
    float _2050 = -_2034;
    float _2052 = _2020 + _2050;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2056 = fma(_2048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2058 = fma(_2052, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    bool _2060 = !_2018;
    if (!_2060)
    {
        float _2062 = -_1159;
        float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2066 = -_1161;
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2070 = -_1163;
        float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2074 = _2064 * _2064;
        float _2076 = fma(_2068, _2068, _2074);
        float _2078 = fma(_2072, _2072, _2076);
        float _2080 = rsqrt(_2078);
        float _2082 = _2064 * _2080;
        float _2084 = _2068 * _2080;
        float _2086 = _2072 * _2080;
        float _2088 = sqrt(_2078);
        float _2090 = -_1331;
        float _2092 = _2090 + _2082;
        float _2094 = -_1327;
        float _2096 = _2094 + _2084;
        float _2098 = -_1329;
        float _2100 = _2098 + _2086;
        float _2102 = _2092 * _2092;
        float _2104 = fma(_2096, _2096, _2102);
        float _2106 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2108 = precise::clamp(_2106, 0.0, 1.0);
        float _2110 = fma(_2100, _2100, _2104);
        float _2112 = _2108 * _2108;
        float _2114 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2116 = -_2088;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2120 = _2112 + (-1.0);
        float _2122 = rsqrt(_2110);
        float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        float _2128 = -_2082;
        float _2130 = -_2114;
        float _2132 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2130);
        float _2134 = _1754 * _2082;
        float _2136 = -_2086;
        float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2132);
        float _2140 = fma(_1736, _2084, _2134);
        float _2142 = abs(_2126);
        float _2144 = log2(_2142);
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2148 = _2138 + _2146;
        float _2150 = fma(_1756, _2086, _2140);
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2156 = precise::clamp(_2154, 0.0, 1.0);
        float _2158 = _2092 * _2122;
        float _2160 = _2096 * _2122;
        float _2162 = _2100 * _2122;
        float _2164 = _1754 * _2158;
        float _2166 = fma(_1736, _2160, _2164);
        float _2168 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2170 = fma(_1756, _2162, _2166);
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = exp2(_2168);
        float _2176 = _2172 * _2172;
        float _2178 = fma(_2176, _2120, 1.0);
        float _2180 = _2178 * _2178;
        float _2182 = 1.0 / _2180;
        float _2184 = _2174 * _2156;
        float _2186 = _2152 * _2184;
        float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2190 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2192 = _2112 * _2182;
        float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2196 = _2186 * _2192;
        out.m_91.x = _2194;
        out.m_91.y = _2188;
        out.m_91.z = _2190;
        float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2200 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2202 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2198;
        out.m_93.y = _2200;
        out.m_93.z = _2202;
    }
    out.m_95.x = _2054;
    out.m_95.y = _2056;
    out.m_95.z = _2058;
    if (!_2040)
    {
        return out;
    }
    out.m_58.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1896 = false;
    bool _678 = false;
    bool _666 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2262 = as_type<float>(_130);
        out.gl_Position.z = _2262;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = _148;
    if (_144)
    {
        float _152 = float(_114);
        _122 = _152;
    }
    float _154 = _122;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _150;
    if (_160)
    {
        out.m_58.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2331 = as_type<float>(_166);
        out.gl_Position.z = _2331;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _176 = in.m_64.x;
    float _178 = in.m_64.y;
    float _180 = in.m_64.z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _184 = in.m_66.x;
    float _186 = in.m_66.y;
    float _188 = in.m_66.z;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _192 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _194 = _182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _196 = as_type<float>(int(gl_VertexIndex));
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _200 = _190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _202 = _192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _204 = in.m_55.x;
    float _206 = in.m_55.y;
    float _208 = in.m_55.z;
    float _210 = _198 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _212 = in.m_71.x;
    float _214 = in.m_71.y;
    float _216 = _168 * _168;
    float _218 = _170 * _170;
    float _220 = _172 * _172;
    float _222 = in.m_64.w;
    float _224 = fma(_176, _176, _216);
    float _226 = fma(_178, _178, _218);
    float _228 = fma(_180, _180, _220);
    float _230 = in.m_62.w;
    float _232 = fma(_184, _184, _224);
    float _234 = fma(_186, _186, _226);
    float _236 = fma(_188, _188, _228);
    float _238 = sqrt(_232);
    int _240 = as_type<int>(_196) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_196) & 2;
    bool _246 = _244 != 0;
    out.m_73.x = _200;
    out.m_73.y = _202;
    out.m_73.z = _210;
    float _248 = _178 * _206;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _252 = _250 != 0;
    float _254 = in.m_75.x;
    float _256 = in.m_75.y;
    int _258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _260 = _258 != 0;
    float _262 = sqrt(_234);
    bool _264 = !_242;
    float _266 = _264 ? (-0.5) : 0.5;
    float _268 = fma(_176, _204, _248);
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _170 * _206;
    bool _276 = _212 > 0.5;
    float _278 = fma(_180, _208, _268);
    bool _280 = _214 > 0.5;
    float _282 = sqrt(_236);
    bool _284 = _238 > 0.0;
    float _286 = fma(_168, _204, _274);
    float _288 = _186 * _206;
    float _290 = _278 + _222;
    float _292 = fma(_172, _208, _286);
    bool _294 = _262 > 0.0;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _298 = in.m_66.w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _302 = fma(_184, _204, _288);
    float _304 = _296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _306 = 0.0;
    float _308 = _204;
    float _310 = _168;
    float _312 = _170;
    if (_284)
    {
        float _314 = rsqrt(_232);
        _306 = _314;
    }
    float _316 = _306;
    float _318 = _300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _320 = _282 > 0.0;
    float _322 = _254 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _324 = _292 + _230;
    float _326 = fma(_188, _208, _302);
    float _328 = _256 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    out.m_77.x = _304;
    out.m_77.y = _318;
    out.m_77.z = _194;
    float _330 = _222;
    float _332 = _328;
    float _334 = _282;
    if (_294)
    {
        float _336 = rsqrt(_234);
        _330 = _336;
    }
    float _338 = _330;
    float _340 = _322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _266);
    float _344 = _324 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _346 = _290 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _348 = _236;
    float _350 = _342;
    float _352 = _340;
    if (_320)
    {
        float _354 = rsqrt(_236);
        _348 = _354;
    }
    float _356 = _348;
    float _358 = _328 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _360 = _326 + _298;
    float _362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _364 = _298;
    float _366 = _362;
    if (!_284)
    {
        _364 = 0.0;
    }
    float _368 = _364;
    float _370 = _368;
    if (_284)
    {
        float _372 = _316 * _176;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = _340 * _342;
    float _378 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _380 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    if (!_294)
    {
        _308 = 0.0;
        _350 = 0.0;
    }
    float _382 = _308;
    float _384 = _350;
    float _386 = _358 * _362;
    float _388 = _382;
    float _390 = _384;
    if (_294)
    {
        float _392 = _338 * _178;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _394;
    if (!_320)
    {
        _366 = 0.0;
    }
    float _398 = _366;
    float _400 = _360 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _402 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].x, _380);
    float _404 = _398;
    if (_320)
    {
        float _406 = _356 * _180;
        _404 = _406;
    }
    float _408 = _404;
    float _410 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _412 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    if (_294)
    {
        float _414 = _338 * _186;
        _390 = _414;
    }
    float _416 = _390;
    float _418 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].x, _402);
    if (!_284)
    {
        _352 = 0.0;
        _332 = 0.0;
    }
    float _420 = _352;
    float _422 = _332;
    float _424 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].y, _412);
    float _426 = _422;
    float _428 = _420;
    if (_284)
    {
        float _430 = _316 * _184;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = _418 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _436 = _344 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _438 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].y, _424);
    float _440 = -_272;
    int _442 = _280 ? as_type<int>(_440) : as_type<int>(_272);
    float _444 = _434 * _378;
    float _446 = fma(_346, (*spvDescriptorSet0.vp_c12)._m0[6].z, _436);
    float _448 = _438 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _450 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _452 = fma(_444, 0.5, 0.5);
    float _454 = -_266;
    int _456 = _276 ? as_type<int>(_454) : as_type<int>(_266);
    float _458 = _448 * _410;
    bool _460 = !_260;
    float _462 = _460 ? _272 : as_type<float>(_442);
    float _464 = fma(_400, (*spvDescriptorSet0.vp_c12)._m0[8].z, _446);
    bool _466 = !_252;
    float _468 = _466 ? _266 : as_type<float>(_456);
    float _470 = fma(_458, 0.5, 0.5);
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _474 = -_462;
    float _476 = _474 + 0.5;
    float _478 = _464 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _480 = _468 + 0.5;
    float _482 = _448;
    if (_284)
    {
        float _484 = _316 * _168;
        _428 = _484;
    }
    float _486 = _428;
    float _488 = _476 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_294)
    {
        _310 = 0.0;
    }
    float _490 = _310;
    float _492 = _480 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _494 = floor(_470);
    float _496 = _478 * _450;
    float _498 = _490;
    if (_294)
    {
        float _500 = _338 * _170;
        _498 = _500;
    }
    float _502 = _498;
    float _504 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_320)
    {
        _312 = 0.0;
    }
    float _506 = _312;
    float _508 = _492 * _174;
    float _510 = _506;
    if (!_320)
    {
        _482 = 0.0;
    }
    float _512 = _482;
    float _514 = _512;
    if (_320)
    {
        float _516 = _356 * _188;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = floor(_452);
    float _522 = _488 * _472;
    float _524 = fma(_496, 0.5, 0.5);
    float _526 = _266 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _528 = _518;
    if (_320)
    {
        float _530 = _356 * _172;
        _514 = _530;
    }
    float _532 = _514;
    float _534 = _386 * _394;
    float _536 = _386 * _502;
    float _538 = _386 * _416;
    float _540 = _504 * _502;
    float _542 = -_494;
    float _544 = _470 + _542;
    float _546 = floor(_524);
    float _548 = _504 * _394;
    out.m_79.x = _508;
    out.m_79.y = _522;
    float _550 = _504 * _416;
    float _552 = fma(_376, _486, _536);
    float _554 = fma(_526, _486, _540);
    float _556 = -_520;
    float _558 = _452 + _556;
    float _560 = fma(_544, 2.0, -1.0);
    float _562 = fma(_376, _374, _534);
    float _564 = fma(_526, _374, _548);
    float _566 = fma(_526, _432, _550);
    float _568 = fma(_376, _432, _538);
    float _570 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _572 = fma(_558, 2.0, -1.0);
    float _574 = fma(_570, _532, _552);
    float _576 = _560 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _578 = fma(_570, _408, _562);
    float _580 = fma(_570, _518, _568);
    float _582 = _572 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _586 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _588 = _576 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _590 = -_546;
    float _592 = _524 + _590;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].x, _584);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].y, _586);
    float _598 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[2].z, _588);
    float _600 = fma(_592, 2.0, -1.0);
    float _602 = _564 + _408;
    bool _604 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _606 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _608 = _604 || _606;
    bool _610 = isnan(1.0);
    bool _612 = _608 || _610;
    float _614 = _600 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _616 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].x, _594);
    float _618 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].y, _596);
    float _620 = fma(_614, (*spvDescriptorSet0.vp_c12)._m0[4].z, _598);
    float _622 = _554 + _532;
    float _624 = _616 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _626 = _618 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _628 = _620 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _630 = _566 + _518;
    float _632 = _578 + _624;
    float _634 = _574 + _626;
    float _636 = _580 + _628;
    float _638 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _640 = _544;
    float _642 = _592;
    float _644 = _616;
    float _646 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _648 = _616;
    float _650 = _572;
    float _652 = _560;
    float _654 = _620;
    float _656 = _600;
    float _658 = _580;
    float _660 = _628;
    float _670;
    float _672;
    float _674;
    float _676;
    if (!_612)
    {
        bool _662 = _626 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _664 = !_662;
        _666 = _664;
        if (!_666)
        {
            float _668 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _670 = _668;
            _672 = 0.0;
            _674 = 0.0;
            _676 = 0.0;
            _678 = true;
        }
    }
    if ((!_678) || _666)
    {
        bool _714;
        if (!_666)
        {
            bool _680 = _626 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _682 = isnan(_626);
            bool _684 = _680 || _682;
            bool _686 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _688 = _684 || _686;
            bool _690 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _692 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _694 = !_688;
            bool _696 = _692 && _694;
            if (_696)
            {
                _638 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _698 = _638;
            float _700 = _698;
            if (_696)
            {
                _640 = 0.0;
            }
            float _702 = _640;
            _672 = _702;
            if (_696)
            {
                _642 = 0.0;
            }
            float _704 = _642;
            _674 = _704;
            if (_696)
            {
                float _706 = _698 * 5.0;
                _700 = _706;
            }
            float _708 = _700;
            _646 = _708;
            _670 = _708;
            if (_696)
            {
                _644 = 0.0;
            }
            float _710 = _644;
            bool _712 = !_688;
            _714 = _712 && _690;
            _648 = _710;
            _676 = _710;
        }
        if ((!_714) || _666)
        {
            _666 = false;
            float _716 = _646;
            float _718 = _648;
            bool _720 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _722 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _724 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _726 = _574;
            float _728 = _718;
            _672 = _632;
            _674 = _634;
            if (_720)
            {
                float _730 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _726 = _730;
            }
            float _732 = _726;
            if (_720)
            {
                float _734 = abs(_572);
                float _736 = -_734;
                float _738 = _736 + 1.0;
                _650 = _738;
            }
            float _740 = _650;
            if (_722)
            {
                float _742 = abs(_560);
                float _744 = -_742;
                float _746 = _744 + 1.0;
                _652 = _746;
            }
            float _748 = _652;
            if (!_720)
            {
                _654 = 1.0;
            }
            float _750 = _654;
            float _752 = _750;
            if (_724)
            {
                float _754 = abs(_600);
                float _756 = -_754;
                float _758 = _756 + 1.0;
                _656 = _758;
            }
            float _760 = _656;
            if (!_722)
            {
                _658 = 1.0;
            }
            float _762 = _658;
            float _764 = _762;
            if (!_724)
            {
                _728 = 1.0;
            }
            float _766 = _728;
            float _768 = _566;
            float _770 = _766;
            if (_722)
            {
                float _772 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _768 = _772;
            }
            float _774 = _768;
            float _776 = _716;
            if (_724)
            {
                float _778 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _776 = _778;
            }
            float _780 = _776;
            if (_720)
            {
                float _782 = _740 * _732;
                float _784 = precise::clamp(_782, 0.0, 1.0);
                _752 = _784;
            }
            float _786 = _752;
            if (_722)
            {
                float _788 = _748 * _774;
                float _790 = precise::clamp(_788, 0.0, 1.0);
                _764 = _790;
            }
            float _792 = _764;
            float _794 = _786 * _792;
            if (_724)
            {
                float _796 = _760 * _780;
                float _798 = precise::clamp(_796, 0.0, 1.0);
                _770 = _798;
            }
            float _800 = _770;
            float _802 = _794 * _800;
            _670 = _636;
            _676 = _802;
        }
    }
    _678 = false;
    float _804 = _670;
    float _806 = _672;
    float _808 = _674;
    float _810 = _676;
    float _812 = fma(_624, 6.2500002968590706586837768554688e-05, 0.5);
    float _814 = fma(_628, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3360 = float2(_812, _814);
    float _816 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3360, float2(0.0), isnan(_3360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3360, float2(0.0), isnan(_3360)), level(0.0)).x;
    float _818 = in.m_81.w;
    float _820 = trunc(_818);
    int _822 = int(_820);
    int _824 = _822 << 5;
    uint _827 = uint(int(uint(_824) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_827)];
    float _829 = as_type<float>(_dmw0.x);
    int _831 = _824 + 4;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    float _835 = as_type<float>(_dmw0.y);
    int _837 = _824 + 8;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    float _841 = as_type<float>(_dmw0.z);
    int _843 = _824 + 12;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    float _847 = as_type<float>(_dmw0.w);
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _804 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _855 = _806 + _853;
    float _857 = _851 * _851;
    float _859 = fma(_855, _855, _857);
    float _861 = sqrt(_859);
    bool _863 = _861 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _865 = _847 * 2.0;
    bool _867 = !_863;
    float _869 = _808;
    float _871 = _806;
    float _873 = _804;
    float _875 = _810;
    if (!_867)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _861 + _879;
        float _883 = rsqrt(_859);
        float _885 = _881 * _877;
        float _887 = _808 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _885 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _883 * _901;
        float _907 = fma(_893, _808, _903);
        float _909 = fma(_855, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_851, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _869 = _907;
        _871 = _909;
        _873 = _911;
    }
    float _913 = _869;
    float _915 = _871;
    float _917 = _873;
    float _919 = _829 * 2.0;
    float _921 = _841 * _865;
    float _923 = _829 * _829;
    float _925 = _835 * _835;
    float _927 = _835 * _865;
    float _929 = _829 * _865;
    float _931 = -_921;
    float _933 = fma(_835, _919, _931);
    float _935 = fma(_835, _919, _921);
    float _937 = _835 * 2.0;
    float _939 = fma(_923, -2.0, 1.0);
    float _941 = fma(_925, -2.0, 1.0);
    float _943 = fma(_841, _919, _927);
    float _945 = _626 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _947 = -_927;
    float _949 = fma(_841, _919, _947);
    float _951 = _626 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _953 = _816 * 2000.0;
    float _955 = -_929;
    float _957 = fma(_841, _937, _955);
    float _959 = _841 * _841;
    float _961 = fma(_841, _937, _929);
    float _963 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _945);
    float _965 = fma(_624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _951);
    bool _967 = _626 >= _953;
    bool _969 = isnan(_626);
    bool _971 = _967 || _969;
    bool _973 = isnan(_953);
    bool _975 = _971 || _973;
    float _977 = fma(_959, -2.0, _941);
    float _979 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _963);
    float _981 = fma(_628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _965);
    float _983 = fma(_959, -2.0, _939);
    float _985 = _979 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = fma(_925, -2.0, _939);
    float _991 = _987 + _985;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = 1.0 / _985;
    float _1005 = _987;
    float _1007 = _915;
    float _1009 = _917;
    float _1011 = _913;
    if (_975)
    {
        _1005 = _913;
    }
    float _1013 = _1005;
    float _1015 = _1013;
    if (!_975)
    {
        _1015 = 0.0;
    }
    float _1017 = _1015;
    float _1019 = _1017;
    if (!_975)
    {
        _1007 = 0.0;
    }
    float _1021 = _1007;
    float _1023 = -_626;
    float _1025 = _1023 + _1017;
    float _1027 = _1025;
    if (!_975)
    {
        _1019 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1029 = _1019;
    float _1031 = -_624;
    float _1033 = _1031 + _1021;
    float _1035 = _1025 * _502;
    float _1037 = _1025 * _486;
    if (!_975)
    {
        float _1039 = _1029 * 5.0;
        _1009 = _1039;
    }
    float _1041 = _1009;
    float _1043 = _991 * _1003;
    float _1045 = _1043 * 0.5;
    float _1047 = fma(_1033, _394, _1035);
    float _1049 = -_628;
    float _1051 = _1049 + _1041;
    float _1053 = fma(_1033, _374, _1037);
    bool _1055 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    float _1065 = _1025 * _532;
    float _1067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1069 = fma(_1045, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1067);
    float _1071 = fma(_1051, _416, _1047);
    float _1073 = fma(_1051, _432, _1053);
    float _1075 = fma(_1033, _408, _1065);
    float _1077 = _1071 * _933;
    float _1079 = _1071 * _983;
    float _1081 = _1071 * _961;
    float _1083 = 1.0 / _1069;
    float _1085 = fma(_1051, _518, _1075);
    float _1087 = fma(_1073, _977, _1077);
    float _1089 = fma(_1073, _935, _1079);
    float _1091 = fma(_1073, _949, _1081);
    float _1093 = _1073;
    if (_1063)
    {
        _1011 = 1.0;
    }
    float _1095 = _1011;
    float _1097 = fma(_1085, _943, _1087);
    float _1099 = fma(_1085, _957, _1089);
    float _1101 = fma(_1085, _989, _1091);
    float _1103 = _624 + _1097;
    float _1105 = _626 + _1099;
    float _1107 = _628 + _1101;
    float _1109 = _1105;
    float _1111 = _1103;
    float _1113 = _1107;
    float _1115 = _1099;
    float _1117 = _1095;
    if (!_1001)
    {
        float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1121 = _626 + _1119;
        float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1125 = _624 + _1123;
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1129 = _1121 * _1121;
        float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1133 = _628 + _1131;
        float _1135 = fma(_1125, _1125, _1129);
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1139 = fma(_1133, _1133, _1135);
        float _1141 = sqrt(_1139);
        float _1143 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1145 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1147 = _1145 * _1137;
        float _1149 = _1143 * _1147;
        float _1151 = fma(_1099, _1149, _626);
        float _1153 = fma(_1097, _1149, _624);
        float _1155 = fma(_1101, _1149, _628);
        _1093 = _1137;
        _1109 = _1151;
        _1111 = _1153;
        _1113 = _1155;
    }
    float _1157 = _1093;
    float _1159 = _1109;
    float _1161 = _1111;
    float _1163 = _1113;
    float _1165 = _1157;
    if (_1063)
    {
        _1027 = 1.0;
    }
    float _1167 = _1027;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1171 = _1083 * _1169;
    float _1173 = _1167;
    if (!_1063)
    {
        float _1175 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1177 = _1175 * 0.15915493667125701904296875;
        float _1179 = _1177 * 6.283185482025146484375;
        float _1181 = cos(_1179);
        float _1183 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1177 * 6.283185482025146484375;
        float _1189 = sin(_1187);
        float _1191 = 1.0 / _1181;
        float _1193 = _1185 * 6.283185482025146484375;
        float _1195 = cos(_1193);
        float _1197 = _1189 * _1191;
        float _1199 = _1185 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        float _1203 = _1195 * _1197;
        float _1205 = 1.0 / _1203;
        float _1207 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1209 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1207;
        float _1211 = 1.0 / _1209;
        float _1213 = _1201 * _1205;
        float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1217 = fma(_1171, _1213, _1215);
        float _1219 = _1217 * _1211;
        float _1221 = precise::clamp(_1219, 0.0, 1.0);
        _396 = _1217;
        _1165 = _1205;
        _1115 = _1191;
        _528 = _1185;
        _1117 = _1221;
    }
    float _1223 = _396;
    float _1225 = _1165;
    float _1227 = _1115;
    float _1229 = _528;
    float _1231 = _1117;
    float _1233 = _1225;
    float _1235 = _1223;
    float _1237 = _1227;
    float _1239 = _1229;
    if (!_1063)
    {
        float _1241 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1243 = _1241 * 0.15915493667125701904296875;
        float _1245 = _1243 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1251 = _1249 * 0.15915493667125701904296875;
        float _1253 = _1243 * 6.283185482025146484375;
        float _1255 = sin(_1253);
        float _1257 = 1.0 / _1247;
        float _1259 = _1251 * 6.283185482025146484375;
        float _1261 = cos(_1259);
        float _1263 = _1255 * _1257;
        float _1265 = _1251 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        float _1269 = _1261 * _1263;
        float _1271 = 1.0 / _1269;
        float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1275 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1273;
        float _1277 = 1.0 / _1275;
        float _1279 = _1267 * _1271;
        float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1283 = fma(_1171, _1279, _1281);
        float _1285 = _1283 * _1277;
        float _1287 = precise::clamp(_1285, 0.0, 1.0);
        float _1289 = -_1287;
        float _1291 = _1289 + 1.0;
        _1233 = _1277;
        _1235 = _1257;
        _1237 = _1279;
        _1239 = _1271;
        _1173 = _1291;
    }
    float _1293 = _1233;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = _1173;
    float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1305 = _1159 + _1303;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1161 + _1307;
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1313 = _1163 + _1311;
    float _1315 = _1305 * _1305;
    float _1317 = fma(_1309, _1309, _1315);
    float _1319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1321 = fma(_1313, _1313, _1317);
    float _1323 = rsqrt(_1321);
    float _1325 = sqrt(_1321);
    float _1327 = _1309 * _1323;
    float _1329 = _1313 * _1323;
    float _1331 = _1305 * _1323;
    float _1333 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1335 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1337 = _1333 * _1333;
    float _1339 = _1335 * _1335;
    float _1341 = _1337 + _1339;
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1349 = _1343 + _1347;
    float _1351 = _1293;
    float _1353 = _1299;
    float _1355 = _1349;
    float _1357 = _1295;
    float _1359 = _1323;
    float _1361 = _1333;
    if (_1345)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1363;
    }
    float _1365 = _1351;
    if (_1345)
    {
        float _1367 = rsqrt(_1341);
        _1353 = _1367;
    }
    float _1369 = _1353;
    float _1371 = _1369;
    if (_1345)
    {
        float _1373 = _1349 * _1365;
        _1355 = _1373;
    }
    float _1375 = _1355;
    if (_1345)
    {
        float _1377 = _1375 * 0.15915493667125701904296875;
        _1357 = _1377;
    }
    float _1379 = _1357;
    float _1381 = _1365;
    if (_1345)
    {
        float _1383 = _1379 * 6.283185482025146484375;
        float _1385 = sin(_1383);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1391 = precise::max(0.0, _1389);
    float _1393 = _1297;
    if (_1345)
    {
        float _1395 = _1379 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        _1393 = _1397;
    }
    float _1399 = _1393;
    float _1401 = -_1331;
    float _1403 = -_1391;
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1403);
    float _1407 = _1405;
    if (_1345)
    {
        float _1409 = _1405 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1359 = _1409;
    }
    float _1411 = _1359;
    float _1413 = _1387;
    float _1415 = _1411;
    if (_1345)
    {
        float _1417 = fma(_1387, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    float _1423 = _1399;
    if (_1345)
    {
        float _1425 = _1399 + (-1.0);
        _1415 = _1425;
    }
    float _1427 = _1415;
    float _1429 = _1427;
    if (_1345)
    {
        float _1431 = _1369 * _1419;
        _334 = _1431;
    }
    float _1433 = _334;
    if (!_1345)
    {
        _1421 = _1337;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1345)
    {
        float _1439 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1371 = _1439;
    }
    float _1441 = _1371;
    if (_1345)
    {
        float _1443 = _1333 * _1433;
        _1361 = _1443;
    }
    float _1445 = _1361;
    if (!_1345)
    {
        _1429 = _1335;
    }
    float _1447 = _1429;
    float _1449 = _1447;
    if (_1345)
    {
        float _1451 = _1335 * _1433;
        _1449 = _1451;
    }
    float _1453 = _1449;
    if (_1345)
    {
        float _1455 = fma(_1405, _1399, _1441);
        _1407 = _1455;
    }
    float _1457 = _1407;
    if (_1345)
    {
        float _1459 = _1445 * _1445;
        _1437 = _1459;
    }
    float _1461 = _1437;
    if (!_1345)
    {
        _1423 = _1339;
    }
    float _1463 = _1423;
    float _1465 = _1463;
    if (_1345)
    {
        float _1467 = _1453 * _1453;
        _1465 = _1467;
    }
    float _1469 = _1465;
    float _1471 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1473 = fma(_1457, _1457, _1461);
    float _1475 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1471);
    float _1477 = _1473 + _1469;
    float _1479 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1483 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1481);
    float _1485 = precise::clamp(_1483, 0.0, 1.0);
    float _1487 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1475);
    float _1489 = rsqrt(_1477);
    float _1491 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1493 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1479);
    float _1495 = -_1485;
    float _1497 = _1495 + 1.0;
    float _1499 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1501 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1491);
    float _1503 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1493);
    float _1505 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1507 = fma(_1161, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1499);
    float _1509 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1501);
    float _1511 = _1503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1513 = abs(_1497);
    float _1515 = log2(_1513);
    float _1517 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1507);
    float _1519 = _1509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1521 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1523 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1525 = _1489 * _1445;
    float _1527 = _1489 * _1453;
    float _1529 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1521);
    float _1531 = _1489 * _1457;
    float _1533 = _1525 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1535 = _1517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1537 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1529);
    float _1539 = -_1523;
    float _1541 = fma(_1539, _1319, 1.0);
    float _1543 = -_1533;
    float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1543);
    float _1547 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1549 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1537);
    float _1551 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1553 = -_1527;
    float _1555 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1545);
    float _1557 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1559 = log2(_1541);
    float _1561 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1547);
    float _1563 = fma(_1555, -0.5, 0.5);
    float _1565 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1557);
    float _1567 = fma(_1555, 0.5, 0.5);
    float _1569 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1561);
    float _1571 = _1531 + 1.0;
    float _1573 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1565);
    float _1575 = exp2(_1551);
    float _1577 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1573);
    float _1579 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1569);
    float _1581 = 1.0 / _1549;
    float _1583 = fma(_1567, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1585 = _1559 * 0.693147182464599609375;
    float _1587 = fma(_1567, _1583, -0.212114393711090087890625);
    float _1589 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1591 = sqrt(_1563);
    float _1593 = -_1531;
    float _1595 = fma(_1575, _1571, _1593);
    float _1597 = fma(_1567, _1587, 1.570728778839111328125);
    float _1599 = fma(_1595, 0.5, 0.5);
    float _1601 = _1577 * _1581;
    float _1603 = _1579 * _1581;
    float _1605 = fma(_1601, 0.5, 0.5);
    float _1607 = fma(_1603, -0.5, 0.5);
    float _1609 = _1591 * 0.636619746685028076171875;
    float3 _4582 = float3(_1605, _1607, _1589);
    float _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4582, float3(0.0), isnan(_4582)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4582, float3(0.0), isnan(_4582)), level(0.0)).x;
    float3 _4593 = float3(_1605, _1607, _1589);
    float4 _1614 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4593, float3(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4593, float3(0.0), isnan(_4593)), level(0.0)).xyzw;
    float _1616 = _1614.x;
    float _1618 = _1614.y;
    float _1620 = _1614.z;
    float _1622 = _1614.w;
    float _1624 = -_1597;
    float _1626 = fma(_1609, _1624, 1.0);
    float2 _4614 = float2(_1626, _1599);
    float3 _1630 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4614, float2(0.0), isnan(_4614)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4614, float2(0.0), isnan(_4614)), level(0.0)).xyz;
    float _1632 = _1630.x;
    float _1634 = _1630.y;
    float _1636 = _1630.z;
    float _1638 = _622 * _983;
    out.m_83.x = _1161;
    out.m_83.y = _1159;
    out.m_83.z = _1163;
    float _1640 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1642 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1650 = _1646 || _1648;
    float _1652 = (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1654 = _1549;
    float _1656 = _1579;
    if (!_975)
    {
        _875 = 0.0;
    }
    float _1658 = _875;
    float _1660 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1662 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1660);
    float _1664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1666 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1664);
    bool _1668 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1670 = isnan(_1325);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1676 = _1672 || _1674;
    float _1678 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1662);
    float _1680 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1666);
    float _1682 = _624 + _1678;
    float _1684 = _628 + _1680;
    if (_1650)
    {
        float _1686 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1652 = _1686;
    }
    float _1688 = _1652;
    float _1690 = _1688;
    if (!_1650)
    {
        _660 = 1.0;
    }
    float _1692 = _660;
    float _1694 = -_1682;
    float _1696 = _1694 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1698 = -_1684;
    float _1700 = _1698 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1702 = _1692;
    if (_1650)
    {
        float _1704 = precise::min(_1688, 20.0);
        _1690 = _1704;
    }
    float _1706 = _1690;
    float _1708 = precise::min(_1682, _1696);
    float _1710 = precise::min(_1684, _1700);
    float _1712 = _622 * _933;
    float _1714 = _1706;
    if (_1650)
    {
        float _1716 = 1.0 / _1706;
        _1714 = _1716;
    }
    float _1718 = _1714;
    float _1720 = _622 * _961;
    float _1722 = precise::min(_1708, _1710);
    float _1724 = _1515 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1726 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = fma(_602, _977, _1712);
    float _1730 = fma(_602, _949, _1720);
    float _1732 = exp2(_1724);
    float _1734 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1736 = fma(_630, _943, _1728);
    float _1738 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1734);
    float _1740 = _1577;
    if (_1650)
    {
        float _1742 = _1722 * _1718;
        float _1744 = precise::clamp(_1742, 0.0, 1.0);
        _1702 = _1744;
    }
    float _1746 = _1702;
    float _1748 = fma(_602, _935, _1638);
    float _1750 = fma(_1535, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1738);
    float _1752 = _1658 * _1746;
    float _1754 = fma(_630, _957, _1748);
    float _1756 = fma(_630, _989, _1730);
    float _1758 = _1750 + _1549;
    float _1760 = -_1732;
    float _1762 = _1760 + 1.0;
    out.gl_Position.x = _1577;
    out.gl_Position.y = _1579;
    out.gl_Position.z = _1750;
    out.gl_Position.w = _1549;
    float _1764 = _1758 * 0.5;
    float _1766 = _1762 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_85.x = _1736;
    out.m_85.y = _1754;
    out.m_85.z = _1756;
    out.m_87.z = _1764;
    out.m_87.w = _1549;
    float _1768 = _1750;
    if (!_1676)
    {
        _1654 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1770 = _1654;
    float _1772 = _1770;
    float _1774 = _1770;
    if (!_1676)
    {
        _1768 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1776 = _1768;
    float _1778 = _1776;
    float _1780 = _1776;
    if (!_1676)
    {
        _1656 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1782 = _1656;
    float _1784 = _1782;
    float _1786 = _1782;
    if (!_1676)
    {
        _1740 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1788 = _1740;
    float _1790 = _1766 * _1611;
    float _1792 = -_1766;
    float _1794 = _1792 + 1.0;
    float _1796 = _1231 * _1301;
    float _1798 = _1622 * _1790;
    float _1800 = _1622 * _1794;
    float _1802 = _1752 * _1796;
    float _1804 = _1636 * _1790;
    float _1806 = fma(_1632, _1798, _1616);
    float _1808 = fma(_1634, _1798, _1618);
    float _1810 = _1616;
    float _1812 = _1802;
    float _1814 = _1788;
    float _1816 = _1788;
    if (!_1676)
    {
        _1810 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1818 = _1810;
    float _1820 = fma(_1622, _1804, _1620);
    float _1822 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1824 = _1818;
    float _1826 = _1818;
    if (!_1676)
    {
        _1812 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1828 = _1812;
    out.m_89.x = _1806;
    out.m_89.y = _1808;
    out.m_89.z = _1820;
    out.m_89.w = _1800;
    bool _1830 = !_1676;
    float _1832 = _1828;
    float _1834 = _1828;
    if (!_1830)
    {
        bool _1836 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1838 = isnan(_1325);
        bool _1840 = _1836 || _1838;
        bool _1842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1844 = _1840 || _1842;
        if (!_1844)
        {
            float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1848 = _1325 + _1846;
            float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1852 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1856 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1858 = 1.0 / _1852;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1866 = _1864 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1868 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1870 = _1868 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1876 = _1848 * _1858;
            float _1878 = precise::clamp(_1876, 0.0, 1.0);
            float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1882 = _1880 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1884 = fma(_1878, _1856, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1886 = fma(_1878, _1882, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1888 = fma(_1878, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1890 = fma(_1878, _1866, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1892 = fma(_1878, _1870, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1894 = fma(_1878, _1874, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1774 = _1888;
            _1816 = _1892;
            _1826 = _1884;
            _1786 = _1890;
            _1780 = _1886;
            _1834 = _1894;
            _1896 = true;
        }
        else
        {
            bool _1898 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1900 = isnan(_1325);
            bool _1902 = _1898 || _1900;
            bool _1904 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1906 = _1902 || _1904;
            if (!_1906)
            {
                _1824 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1908 = _1824;
            _1826 = _1908;
            if (!_1906)
            {
                _1772 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1910 = _1772;
            _1774 = _1910;
            if (!_1906)
            {
                _1778 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1912 = _1778;
            _1780 = _1912;
            if (!_1906)
            {
                _1784 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1914 = _1784;
            _1786 = _1914;
            if (!_1906)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1916 = _1814;
            _1816 = _1916;
            if (!_1906)
            {
                _1832 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1918 = _1832;
            bool _1920 = !_1906;
            _1834 = _1918;
            if (!_1920)
            {
                bool _1922 = _1325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1924 = isnan(_1325);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1930 = _1926 || _1928;
                if (!_1930)
                {
                    float _1932 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1934 = _1325 + _1932;
                    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1936;
                    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1942 = _1940 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1944 = 1.0 / _1938;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1956 = _1954 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1960 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1962 = _1934 * _1944;
                    float _1964 = precise::clamp(_1962, 0.0, 1.0);
                    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1968 = _1966 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1970 = fma(_1964, _1942, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1972 = fma(_1964, _1968, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1974 = fma(_1964, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1976 = fma(_1964, _1952, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1978 = fma(_1964, _1956, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1980 = fma(_1964, _1960, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1774 = _1974;
                    _1816 = _1978;
                    _1826 = _1970;
                    _1786 = _1976;
                    _1780 = _1972;
                    _1834 = _1980;
                    _1896 = true;
                }
                else
                {
                    _1774 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1826 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1786 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1780 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1834 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1896 = false;
    float _1982 = _1774;
    float _1984 = _1816;
    float _1986 = _1826;
    float _1988 = _1786;
    float _1990 = _1780;
    float _1992 = _1834;
    float _1994 = fma(_1754, -0.5, 0.5);
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    float _1998 = -_1982;
    float _2000 = _1998 + _1984;
    float _2002 = _1822 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2004 = -_1986;
    float _2006 = _2004 + _1988;
    float _2008 = fma(_1996, _2000, _1982);
    out.m_91.x = 0.0;
    float _2010 = -_1990;
    float _2012 = _2010 + _1992;
    float _2014 = fma(_1996, _2006, _1986);
    float _2016 = _2008 * 0.586610972881317138671875;
    out.m_58.x = _2002;
    bool _2018 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2020 = fma(_1996, _2012, _1990);
    float _2022 = fma(_2014, 0.298911988735198974609375, _2016);
    bool _2024 = _1231 > 0.0;
    bool _2026 = isnan(_1231);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    float _2034 = fma(_2020, 0.114477999508380889892578125, _2022);
    out.m_93.x = 0.0;
    bool _2036 = _1301 <= 0.0;
    bool _2038 = !_2032;
    bool _2040 = _2036 || _2038;
    float _2042 = -_2034;
    float _2044 = _2014 + _2042;
    float _2046 = -_2034;
    float _2048 = _2008 + _2046;
    float _2050 = -_2034;
    float _2052 = _2020 + _2050;
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2056 = fma(_2048, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    float _2058 = fma(_2052, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2034);
    bool _2060 = !_2018;
    if (!_2060)
    {
        float _2062 = -_1159;
        float _2064 = _2062 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2066 = -_1161;
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2070 = -_1163;
        float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2074 = _2064 * _2064;
        float _2076 = fma(_2068, _2068, _2074);
        float _2078 = fma(_2072, _2072, _2076);
        float _2080 = rsqrt(_2078);
        float _2082 = _2064 * _2080;
        float _2084 = _2068 * _2080;
        float _2086 = _2072 * _2080;
        float _2088 = sqrt(_2078);
        float _2090 = -_1331;
        float _2092 = _2090 + _2082;
        float _2094 = -_1327;
        float _2096 = _2094 + _2084;
        float _2098 = -_1329;
        float _2100 = _2098 + _2086;
        float _2102 = _2092 * _2092;
        float _2104 = fma(_2096, _2096, _2102);
        float _2106 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2108 = precise::clamp(_2106, 0.0, 1.0);
        float _2110 = fma(_2100, _2100, _2104);
        float _2112 = _2108 * _2108;
        float _2114 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2116 = -_2088;
        float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2120 = _2112 + (-1.0);
        float _2122 = rsqrt(_2110);
        float _2124 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        float _2128 = -_2082;
        float _2130 = -_2114;
        float _2132 = fma(_2128, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2130);
        float _2134 = _1754 * _2082;
        float _2136 = -_2086;
        float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2132);
        float _2140 = fma(_1736, _2084, _2134);
        float _2142 = abs(_2126);
        float _2144 = log2(_2142);
        float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2148 = _2138 + _2146;
        float _2150 = fma(_1756, _2086, _2140);
        float _2152 = precise::clamp(_2150, 0.0, 1.0);
        float _2154 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2156 = precise::clamp(_2154, 0.0, 1.0);
        float _2158 = _2092 * _2122;
        float _2160 = _2096 * _2122;
        float _2162 = _2100 * _2122;
        float _2164 = _1754 * _2158;
        float _2166 = fma(_1736, _2160, _2164);
        float _2168 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2170 = fma(_1756, _2162, _2166);
        float _2172 = precise::clamp(_2170, 0.0, 1.0);
        float _2174 = exp2(_2168);
        float _2176 = _2172 * _2172;
        float _2178 = fma(_2176, _2120, 1.0);
        float _2180 = _2178 * _2178;
        float _2182 = 1.0 / _2180;
        float _2184 = _2174 * _2156;
        float _2186 = _2152 * _2184;
        float _2188 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2190 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2192 = _2112 * _2182;
        float _2194 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2196 = _2186 * _2192;
        out.m_91.x = _2194;
        out.m_91.y = _2188;
        out.m_91.z = _2190;
        float _2198 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2200 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2202 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2198;
        out.m_93.y = _2200;
        out.m_93.z = _2202;
    }
    out.m_95.x = _2054;
    out.m_95.y = _2056;
    out.m_95.z = _2058;
    if (!_2040)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_58.x = 0.0;
    float _2204 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2204;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

