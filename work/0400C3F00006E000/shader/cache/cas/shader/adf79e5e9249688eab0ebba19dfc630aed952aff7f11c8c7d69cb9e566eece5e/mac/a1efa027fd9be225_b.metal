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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c11 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_66 [[attribute(7)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _121 = 0;
    if (!_115)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_125);
        out.gl_Position.z = _1947;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_58.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_111);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = 0.0;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_163);
        out.gl_Position.z = _2015;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _167 = !_165;
    float _185;
    if (!_167)
    {
        float _169 = in.m_60.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_111);
        float _191 = 1.0 / _189;
        float _193 = _143 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = in.m_62.w;
    float _199 = trunc(_197);
    int _201 = int(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _195 + _203;
    bool _207 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_195);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = in.m_64.x;
    float _221 = in.m_64.y;
    float _223 = in.m_64.z;
    int _225 = _201 << 5;
    uint _228 = uint(int(uint(_225) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_228)];
    float _230 = as_type<float>(_dmw0.x);
    int _232 = _225 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw0.y);
    int _238 = _225 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>(_dmw0.z);
    int _244 = _225 + 12;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>(_dmw0.w);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_195);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_217;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _252;
    float _272 = _264 * _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = _205 * _270;
    float _292 = in.m_66.x;
    float _294 = in.m_66.y;
    float _296 = in.m_66.z;
    float _298 = fma(_280, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_288, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = fma(_284, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = in.m_53.x;
    float _306 = in.m_53.y;
    float _308 = in.m_53.z;
    float _310 = _298 * _272;
    float _312 = _300 * _272;
    float _314 = _302 * _272;
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _320 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _322 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _324 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _326 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].z, _320);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _223);
    float _332 = _322 * _292;
    float _334 = _324 * _294;
    float _336 = _326 * _296;
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _344 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _346 = _340 * _338;
    float _348 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _342 * _328;
    float _352 = _344 * _330;
    float _354 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _362 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    float _364 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].x, _360);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _372 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _376 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _370 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _380 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _368);
    float _382 = _372 + _374;
    float _384 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = _378 + _380;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _382 + _388;
    float _392 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.5);
    bool _402 = _398 || _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _386 + _404;
    float _408 = _390 * _390;
    float _410 = _392 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _412 = fma(_406, _406, _408);
    float _414 = _410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _416 = _350 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.5);
    bool _426 = _422 || _424;
    float _428 = sqrt(_412);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _414);
    float _432 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].x, _416);
    float _434 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    bool _436 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _438 = _248 * 2.0;
    float _440 = _230 * 2.0;
    float _442 = _236 * 2.0;
    float _444 = _236 * _236;
    float _446 = _242 * _438;
    float _448 = _230 * _438;
    float _450 = _236 * _438;
    float _452 = _242 * _242;
    float _454 = -_446;
    float _456 = fma(_236, _440, _454);
    float _458 = fma(_236, _440, _446);
    float _460 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _432);
    float _462 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _464 = -_448;
    float _466 = fma(_242, _442, _464);
    float _468 = fma(_242, _442, _448);
    float _470 = _410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _472 = 1.0 / _462;
    float _474 = fma(_242, _440, _450);
    float _476 = -_450;
    float _478 = fma(_242, _440, _476);
    float _480 = _230 * _230;
    float _482 = _410 + _460;
    float _484 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _470);
    float _486 = _236;
    float _488 = _480;
    float _490 = _460;
    float _492 = _434;
    float _494 = _474;
    if (!_436)
    {
        _486 = _382;
    }
    float _496 = _486;
    float _498 = fma(_480, -2.0, 1.0);
    float _500 = fma(_444, -2.0, 1.0);
    float _502 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    float _504 = _496;
    if (!_436)
    {
        _488 = _386;
    }
    float _506 = _488;
    float _508 = _506;
    if (!_436)
    {
        _490 = _482;
    }
    float _510 = _490;
    bool _512 = !_436;
    float _514 = _510;
    float _516 = _472;
    if (!_512)
    {
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _522 = _428 + _520;
        float _524 = rsqrt(_412);
        float _526 = _522 * _518;
        float _528 = _482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _530 = _526 * 0.15915493667125701904296875;
        float _532 = _530 * 6.283185482025146484375;
        float _534 = cos(_532);
        float _536 = _530 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _534 + (-1.0);
        float _542 = fma(_538, _528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _544 = _540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = _524 * _542;
        float _548 = fma(_482, _534, _544);
        float _550 = fma(_406, _546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _552 = fma(_390, _546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _514 = _548;
        _508 = _550;
        _504 = _552;
    }
    float _554 = _514;
    float _556 = _508;
    float _558 = _504;
    float _560 = _502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _562 = -_410;
    float _564 = _562 + _554;
    float _566 = -_378;
    float _568 = _566 + _556;
    float _570 = _560 + _462;
    float _572 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _574 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _576 = -_372;
    float _578 = _576 + _558;
    float _580 = _570 * _472;
    float _582 = _580 * 0.5;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].y, _572);
    float _586 = fma(_452, -2.0, _500);
    float _588 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _592);
    float _596 = fma(_452, -2.0, _498);
    float _598 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].y, _584);
    float _600 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _602 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _604 = fma(_444, -2.0, _498);
    float _606 = _598 * _456;
    float _608 = _598 * _596;
    float _610 = _598 * _468;
    float _612 = 1.0 / _594;
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _616 = fma(_602, _586, _606);
    float _618 = fma(_602, _458, _608);
    float _620 = fma(_602, _478, _610);
    float _622 = _620;
    if (_402)
    {
        _492 = 1.0;
    }
    float _624 = _492;
    float _626 = fma(_614, _474, _616);
    float _628 = fma(_614, _466, _618);
    float _630 = fma(_614, _604, _620);
    float _632 = _378 + _626;
    float _634 = _410 + _628;
    float _636 = _372 + _630;
    float _638 = _634;
    float _640 = _632;
    float _642 = _636;
    float _644 = _630;
    float _646 = _624;
    float _648 = _626;
    if (!_426)
    {
        float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _652 = _410 + _650;
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _656 = _378 + _654;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _660 = _652 * _652;
        float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _664 = _372 + _662;
        float _666 = fma(_656, _656, _660);
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _670 = fma(_664, _664, _666);
        float _672 = sqrt(_670);
        float _674 = _658 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _676 = precise::min(_672, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _678 = _676 * _668;
        float _680 = _674 * _678;
        float _682 = fma(_628, _680, _410);
        float _684 = fma(_626, _680, _378);
        float _686 = fma(_630, _680, _372);
        _638 = _682;
        _640 = _684;
        _642 = _686;
        _622 = _678;
    }
    float _688 = _638;
    float _690 = _640;
    float _692 = _642;
    float _694 = _622;
    float _696 = 0.0;
    float _698 = _694;
    if (_402)
    {
        _696 = 1.0;
    }
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _704 = _612 * _702;
    float _706 = _700;
    if (!_402)
    {
        float _708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _710 = _708 * 0.15915493667125701904296875;
        float _712 = _710 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _718 = _716 * 0.15915493667125701904296875;
        float _720 = _710 * 6.283185482025146484375;
        float _722 = sin(_720);
        float _724 = 1.0 / _714;
        float _726 = _718 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _722 * _724;
        float _732 = _718 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _738 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _736;
        float _740 = _728 * _730;
        float _742 = 1.0 / _740;
        float _744 = 1.0 / _738;
        float _746 = _734 * _742;
        float _748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _750 = fma(_704, _746, _748);
        float _752 = _750 * _744;
        float _754 = precise::clamp(_752, 0.0, 1.0);
        _644 = _718;
        _698 = _750;
        _646 = _754;
    }
    float _756 = _644;
    float _758 = _698;
    float _760 = _646;
    float _762 = _758;
    float _764 = _756;
    if (!_402)
    {
        float _766 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _768 = _766 * 0.15915493667125701904296875;
        float _770 = _768 * 6.283185482025146484375;
        float _772 = cos(_770);
        float _774 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _768 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = 1.0 / _772;
        float _784 = _776 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _780 * _782;
        float _790 = _776 * 6.283185482025146484375;
        float _792 = sin(_790);
        float _794 = _786 * _788;
        float _796 = 1.0 / _794;
        float _798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _800 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _798;
        float _802 = 1.0 / _800;
        float _804 = _792 * _796;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _808 = fma(_704, _804, _806);
        float _810 = _808 * _802;
        float _812 = precise::clamp(_810, 0.0, 1.0);
        float _814 = -_812;
        float _816 = _814 + 1.0;
        _762 = _796;
        _764 = _782;
        _706 = _816;
    }
    float _818 = _762;
    float _820 = _764;
    float _822 = _706;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _688 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _690 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _834 = _692 + _832;
    float _836 = _826 * _826;
    float _838 = fma(_830, _830, _836);
    float _840 = fma(_834, _834, _838);
    float _842 = rsqrt(_840);
    float _844 = sqrt(_840);
    float _846 = _842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _848 = _830 * _846;
    float _850 = _834 * _846;
    float _852 = _848 * _848;
    float _854 = _850 * _850;
    float _856 = _852 + _854;
    float _858 = sqrt(_856);
    bool _860 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = _858 + _862;
    float _866 = _842;
    float _868 = _820;
    float _870 = _864;
    float _872 = _846;
    float _874 = _826;
    if (_860)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _876;
    }
    float _878 = _866;
    if (_860)
    {
        float _880 = rsqrt(_856);
        _868 = _880;
    }
    float _882 = _868;
    float _884 = _882;
    if (_860)
    {
        float _886 = _864 * _878;
        _870 = _886;
    }
    float _888 = _870;
    if (_860)
    {
        float _890 = _888 * 0.15915493667125701904296875;
        _648 = _890;
    }
    float _892 = _648;
    float _894 = _818;
    if (_860)
    {
        float _896 = _892 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _904 = precise::max(0.0, _902);
    float _906 = _834;
    float _908 = _902;
    float _910 = _904;
    if (_860)
    {
        float _912 = _892 * 6.283185482025146484375;
        float _914 = cos(_912);
        _906 = _914;
    }
    float _916 = _906;
    float _918 = -_846;
    float _920 = -_904;
    float _922 = fma(_826, _918, _920);
    if (_860)
    {
        float _924 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _924;
    }
    float _926 = _908;
    float _928 = _900;
    if (_860)
    {
        float _930 = fma(_900, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _930;
    }
    float _932 = _872;
    float _934 = _932;
    if (!_860)
    {
        _928 = _922;
    }
    float _936 = _928;
    float _938 = _936;
    float _940 = _916;
    if (_860)
    {
        float _942 = _916 + (-1.0);
        _874 = _942;
    }
    float _944 = _874;
    float _946 = _944;
    if (_860)
    {
        float _948 = _882 * _932;
        _516 = _948;
    }
    float _950 = _516;
    if (!_860)
    {
        _884 = _848;
    }
    float _952 = _884;
    float _954 = _952;
    if (_860)
    {
        float _956 = _944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _956;
    }
    float _958 = _910;
    if (_860)
    {
        float _960 = _848 * _950;
        _954 = _960;
    }
    float _962 = _954;
    if (!_860)
    {
        _946 = _850;
    }
    float _964 = _946;
    float _966 = _964;
    if (_860)
    {
        float _968 = _850 * _950;
        _966 = _968;
    }
    float _970 = _966;
    if (_860)
    {
        float _972 = fma(_922, _916, _958);
        _938 = _972;
    }
    float _974 = _938;
    if (!_860)
    {
        _940 = _852;
    }
    float _976 = _940;
    float _978 = _976;
    if (_860)
    {
        float _980 = _962 * _962;
        _978 = _980;
    }
    float _982 = _978;
    if (!_860)
    {
        _934 = _854;
    }
    float _984 = _934;
    float _986 = _984;
    if (_860)
    {
        float _988 = _970 * _970;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_974, _974, _982);
    float _994 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _998 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1000 = _992 + _990;
    float _1002 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _996);
    float _1012 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = rsqrt(_1000);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1024 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1026 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1030 = floor(_998);
    float _1032 = fma(_372, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1036 = -_1028;
    float _1038 = fma(_1036, _1020, 1.0);
    float _1040 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1044 = _1014 * _962;
    float _1046 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1048 = abs(_1018);
    float _1050 = log2(_1048);
    float _1052 = _1014 * _974;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1056 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    float _1058 = _1014 * _970;
    float _1060 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = -_1054;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = floor(_1032);
    float _1070 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1042);
    float _1072 = -_1058;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1076 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1078 = -_1030;
    float _1080 = _998 + _1078;
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1084 = fma(_1074, -0.5, 0.5);
    float _1086 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = log2(_1038);
    float _1092 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1096 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1098 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1092);
    float _1100 = fma(_1074, 0.5, 0.5);
    float _1102 = -_1068;
    float _1104 = _1032 + _1102;
    float _1106 = exp2(_1088);
    float _1108 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1096);
    float _1110 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float2 _3540 = float2(_1080, _1104);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3540, float2(0.0), isnan(_3540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3540, float2(0.0), isnan(_3540)), level(0.0)).x;
    float _1114 = fma(_1100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1108);
    float _1118 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1120 = 1.0 / _1094;
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1116);
    float _1124 = fma(_1100, _1114, -0.212114393711090087890625);
    float _1126 = _1090 * 0.693147182464599609375;
    float _1128 = fma(_1100, _1124, 1.570728778839111328125);
    float _1130 = sqrt(_1084);
    float _1132 = _1122 * _1120;
    float _1134 = _1052 + 1.0;
    float _1136 = -_1052;
    float _1138 = fma(_1106, _1134, _1136);
    float _1140 = _1118 * _1120;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1144 = _1130 * 0.636619746685028076171875;
    float _1146 = fma(_1132, -0.5, 0.5);
    float _1148 = fma(_1140, 0.5, 0.5);
    float _1150 = fma(_1138, 0.5, 0.5);
    float _1152 = -_1128;
    float _1154 = fma(_1144, _1152, 1.0);
    float3 _3617 = float3(_1148, _1146, _1142);
    float _1156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1148, _1146, _1142);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3644 = float2(_1154, _1150);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3644, float2(0.0), isnan(_3644)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3644, float2(0.0), isnan(_3644)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_68.y;
    float _1181 = abs(_704);
    float _1183 = log2(_1181);
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    float _1189 = in.m_60.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1193 = _1191 != 0;
    float _1195 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = in.m_68.x;
    float _1199 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    out.m_70.x = 1.0;
    out.m_70.y = 1.0;
    out.m_70.z = 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1203 = _1144;
    float _1205 = _1201;
    float _1207 = _1197;
    float _1209 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1187)
    {
        float _1211 = in.m_60.x;
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1215);
    float _1219 = in.m_72.x;
    float _1221 = in.m_72.y;
    float _1223 = in.m_72.z;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1227 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1217);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1231 = -_1179;
    float _1233 = _1231 + 1.0;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = _372 + _1227;
    float _1239 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1241 = _1189 > 0.5;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1179;
    if (_1193)
    {
        float _1249 = _1241 ? _1233 : _1179;
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1255 = _221 != 0.0;
    bool _1257 = isnan(_221);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1267 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1269 = _219 == 0.0;
    bool _1271 = !_1263;
    bool _1273 = _1269 && _1271;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1187;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1283 = _223 == 0.0;
    bool _1285 = _1283 && _1273;
    float _1287 = exp2(_1239);
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1293 = _704 <= 8000.0;
    bool _1295 = isnan(_704);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(8000.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_74.x = _1245;
    out.m_74.y = _1253;
    out.m_74.z = _1289;
    out.m_74.w = _1265;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1307);
    if (_1187)
    {
        _1205 = _1197;
    }
    float _1311 = _1205;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1315 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1323 = _1319 || _1321;
    float _1325 = _1221;
    float _1327 = _1219;
    float _1329 = _1223;
    float _1331 = _1311;
    if (!_1285)
    {
        float _1333 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1325 = _1333;
    }
    float _1335 = _1325;
    if (!_1285)
    {
        float _1337 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1327 = _1337;
    }
    float _1339 = _1327;
    float _1341 = _1339;
    if (!_1285)
    {
        float _1343 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1329 = _1343;
    }
    float _1345 = _1329;
    out.m_76.x = _1267;
    out.m_76.y = _1275;
    out.m_76.z = _1313;
    float _1347 = -_1237;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1351 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1309);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1279)
    {
        float _1355 = -_1311;
        float _1357 = _1355 + 1.0;
        _1331 = _1357;
    }
    float _1359 = _1331;
    bool _1361 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1363 = isnan(_844);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1369 = _1365 || _1367;
    float _1371 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1373 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = precise::min(_1237, _1349);
    float _1377 = _378 + _1351;
    if (_1187)
    {
        _1207 = _1359;
    }
    float _1379 = _1207;
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1383 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1371);
    float _1387 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1389 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1391 = -_1377;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1395 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1385);
    float _1397 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1387);
    float _1399 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1389);
    float _1401 = fma(_1287, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = precise::min(_1377, _1393);
    float _1407 = _1397 * _456;
    float _1409 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1411 = fma(_1403, -2.0, 3.0);
    float _1413 = _1403 * _1403;
    float _1415 = in.m_78.x;
    float _1417 = precise::min(_1405, _1375);
    float _1419 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1421 = _1413 * _1411;
    float _1423 = _1397 * _596;
    float _1425 = _1397 * _468;
    float _1427 = _1419 * _1381;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1409 * _1353;
    float _1435 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1199);
    float _1437 = fma(_1395, _458, _1423);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1421);
    float _1441 = exp2(_1291);
    out.m_80.x = _1433;
    out.m_80.y = _1427;
    float _1443 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1435);
    float _1445 = _1303 * _1439;
    float _1447 = fma(_1395, _478, _1425);
    if (_1323)
    {
        float _1449 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1209 = _1449;
    }
    float _1451 = _1209;
    float _1453 = _1443 + _1094;
    float _1455 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1457 = _1451;
    float _1459 = _1094;
    if (_1323)
    {
        float _1461 = precise::min(_1451, 20.0);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = fma(_1395, _586, _1407);
    float _1467 = _1453 * 0.5;
    float _1469 = fma(_1399, _466, _1437);
    float _1471 = fma(_1399, _474, _1465);
    float _1473 = _1463;
    if (_1323)
    {
        float _1475 = 1.0 / _1463;
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = fma(_1399, _604, _1447);
    out.m_82.z = _1467;
    out.m_82.w = _1094;
    float _1481 = -_1441;
    float _1483 = _1481 + 1.0;
    out.m_84.x = _1471;
    out.m_84.y = _1469;
    out.m_84.z = _1479;
    float _1485 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1323)
    {
        _1341 = 1.0;
    }
    float _1487 = _1341;
    out.gl_Position.x = _1118;
    out.gl_Position.y = _1122;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1094;
    float _1489 = _1487;
    if (!_1369)
    {
        _494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1491 = _494;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1369)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1497 = _1459;
    float _1499 = _1497;
    float _1501 = _1497;
    if (_1323)
    {
        float _1503 = _1417 * _1477;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1489 = _1505;
    }
    float _1507 = _1489;
    float _1509 = -_1112;
    float _1511 = _1509 + 1.0;
    float _1513 = _1511 * _1455;
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = -_1515;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1521 = _760 * _822;
    float _1523 = _1519 * _1415;
    float _1525 = _1521 * _1507;
    float _1527 = _1521;
    float _1529 = _1523;
    float _1531 = _1525;
    if (!_1369)
    {
        _1527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _1527;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1539 = _1533;
    float _1541 = _1533;
    if (!_1369)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1369)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1531;
    out.m_86.x = _1535;
    float _1551 = _1485 * _1156;
    float _1553 = -_1485;
    float _1555 = _1553 + 1.0;
    float _1557 = _1167 * _1551;
    float _1559 = _1177 * _1551;
    float _1561 = _1167 * _1555;
    float _1563 = fma(_1173, _1557, _1161);
    float _1565 = fma(_1175, _1557, _1163);
    float _1567 = fma(_1167, _1559, _1165);
    out.m_88.x = _1563;
    out.m_88.y = _1565;
    out.m_88.z = _1567;
    out.m_88.w = _1561;
    float _1569 = _1563;
    float _1571 = _1549;
    float _1573 = _1549;
    if (!_1369)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1575 = _1569;
    bool _1577 = !_1369;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_844);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _844 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1605 = 1.0 / _1599;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1605;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1631 = fma(_1625, _1603, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1501 = _1637;
            _1573 = _1639;
            _1547 = _1635;
            _1541 = _1631;
            _1495 = _1633;
            _1581 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_844);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1545;
            _1547 = _1655;
            if (!_1653)
            {
                _1499 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1499;
            _1501 = _1657;
            if (!_1653)
            {
                _1493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1493;
            _1495 = _1659;
            if (!_1653)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1539;
            _1541 = _1661;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1571;
            _1573 = _1663;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1579;
            bool _1667 = !_1653;
            _1581 = _1665;
            if (!_1667)
            {
                bool _1669 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_844);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _844 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1691 = 1.0 / _1685;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1691;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1717 = fma(_1711, _1689, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1501 = _1723;
                    _1573 = _1725;
                    _1547 = _1721;
                    _1541 = _1717;
                    _1495 = _1719;
                    _1581 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1501 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1501;
    float _1731 = _1573;
    float _1733 = _1547;
    float _1735 = _1541;
    float _1737 = _1495;
    float _1739 = _1581;
    float _1741 = fma(_1469, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    float _1755 = fma(_1743, _1747, _1729);
    out.m_90.x = 0.0;
    float _1757 = -_1737;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1743, _1753, _1733);
    float _1763 = _1755 * 0.586610972881317138671875;
    out.m_56.x = _1749;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1759, _1737);
    float _1769 = fma(_1761, 0.298911988735198974609375, _1763);
    bool _1771 = _760 > 0.0;
    bool _1773 = isnan(_760);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    bool _1783 = _822 <= 0.0;
    bool _1785 = !_1779;
    bool _1787 = _1783 || _1785;
    float _1789 = -_1781;
    float _1791 = _1761 + _1789;
    float _1793 = -_1781;
    float _1795 = _1755 + _1793;
    float _1797 = -_1781;
    float _1799 = _1767 + _1797;
    float _1801 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1805 = fma(_1799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1807 = !_1765;
    if (!_1807)
    {
        float _1809 = -_688;
        float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1813 = -_690;
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1817 = -_692;
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1821 = _1811 * _1811;
        float _1823 = fma(_1815, _1815, _1821);
        float _1825 = fma(_1819, _1819, _1823);
        float _1827 = sqrt(_1825);
        float _1829 = rsqrt(_1825);
        float _1831 = -_1827;
        float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1815 * _1829;
        float _1841 = _1811 * _1829;
        float _1843 = abs(_1837);
        float _1845 = log2(_1843);
        float _1847 = _1819 * _1829;
        float _1849 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1851 = _1469 * _1841;
        float _1853 = -_1841;
        float _1855 = -_1849;
        float _1857 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1855);
        float _1859 = fma(_1471, _1839, _1851);
        float _1861 = -_1847;
        float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1857);
        float _1865 = fma(_1479, _1847, _1859);
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1871 = _1863 + _1869;
        float _1873 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1877 = precise::clamp(_1875, 0.0, 1.0);
        float _1879 = exp2(_1873);
        float _1881 = _1879 * _1877;
        float _1883 = _1867 * _1881;
        float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _1885;
        out.m_90.y = _1887;
        out.m_90.z = _1889;
    }
    out.m_92.x = _1801;
    out.m_92.y = _1803;
    out.m_92.z = _1805;
    if (!_1787)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_56.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _121 = 0;
    if (!_115)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_125);
        out.gl_Position.z = _1947;
    }
    if (!_115)
    {
        return out;
    }
    float _129 = in.m_58.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_111);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = 0.0;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_163);
        out.gl_Position.z = _2015;
    }
    if (_155)
    {
        return out;
    }
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _167 = !_165;
    float _185;
    if (!_167)
    {
        float _169 = in.m_60.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_111);
        float _191 = 1.0 / _189;
        float _193 = _143 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = in.m_62.w;
    float _199 = trunc(_197);
    int _201 = int(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _195 + _203;
    bool _207 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_195);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = in.m_64.x;
    float _221 = in.m_64.y;
    float _223 = in.m_64.z;
    int _225 = _201 << 5;
    uint _228 = uint(int(uint(_225) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_228)];
    float _230 = as_type<float>(_dmw0.x);
    int _232 = _225 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw0.y);
    int _238 = _225 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>(_dmw0.z);
    int _244 = _225 + 12;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>(_dmw0.w);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_195);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_217;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _252;
    float _272 = _264 * _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = _205 * _270;
    float _292 = in.m_66.x;
    float _294 = in.m_66.y;
    float _296 = in.m_66.z;
    float _298 = fma(_280, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_288, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = fma(_284, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = in.m_53.x;
    float _306 = in.m_53.y;
    float _308 = in.m_53.z;
    float _310 = _298 * _272;
    float _312 = _300 * _272;
    float _314 = _302 * _272;
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _320 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _322 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _324 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _326 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].z, _320);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _223);
    float _332 = _322 * _292;
    float _334 = _324 * _294;
    float _336 = _326 * _296;
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _344 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _346 = _340 * _338;
    float _348 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _342 * _328;
    float _352 = _344 * _330;
    float _354 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _362 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    float _364 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].x, _360);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _372 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _376 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _370 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _380 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _368);
    float _382 = _372 + _374;
    float _384 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = _378 + _380;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _382 + _388;
    float _392 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.5);
    bool _402 = _398 || _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _386 + _404;
    float _408 = _390 * _390;
    float _410 = _392 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _412 = fma(_406, _406, _408);
    float _414 = _410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _416 = _350 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.5);
    bool _426 = _422 || _424;
    float _428 = sqrt(_412);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _414);
    float _432 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].x, _416);
    float _434 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    bool _436 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _438 = _248 * 2.0;
    float _440 = _230 * 2.0;
    float _442 = _236 * 2.0;
    float _444 = _236 * _236;
    float _446 = _242 * _438;
    float _448 = _230 * _438;
    float _450 = _236 * _438;
    float _452 = _242 * _242;
    float _454 = -_446;
    float _456 = fma(_236, _440, _454);
    float _458 = fma(_236, _440, _446);
    float _460 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _432);
    float _462 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _464 = -_448;
    float _466 = fma(_242, _442, _464);
    float _468 = fma(_242, _442, _448);
    float _470 = _410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _472 = 1.0 / _462;
    float _474 = fma(_242, _440, _450);
    float _476 = -_450;
    float _478 = fma(_242, _440, _476);
    float _480 = _230 * _230;
    float _482 = _410 + _460;
    float _484 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _470);
    float _486 = _236;
    float _488 = _480;
    float _490 = _460;
    float _492 = _434;
    float _494 = _474;
    if (!_436)
    {
        _486 = _382;
    }
    float _496 = _486;
    float _498 = fma(_480, -2.0, 1.0);
    float _500 = fma(_444, -2.0, 1.0);
    float _502 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    float _504 = _496;
    if (!_436)
    {
        _488 = _386;
    }
    float _506 = _488;
    float _508 = _506;
    if (!_436)
    {
        _490 = _482;
    }
    float _510 = _490;
    bool _512 = !_436;
    float _514 = _510;
    float _516 = _472;
    if (!_512)
    {
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _522 = _428 + _520;
        float _524 = rsqrt(_412);
        float _526 = _522 * _518;
        float _528 = _482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _530 = _526 * 0.15915493667125701904296875;
        float _532 = _530 * 6.283185482025146484375;
        float _534 = cos(_532);
        float _536 = _530 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _534 + (-1.0);
        float _542 = fma(_538, _528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _544 = _540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = _524 * _542;
        float _548 = fma(_482, _534, _544);
        float _550 = fma(_406, _546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _552 = fma(_390, _546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _514 = _548;
        _508 = _550;
        _504 = _552;
    }
    float _554 = _514;
    float _556 = _508;
    float _558 = _504;
    float _560 = _502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _562 = -_410;
    float _564 = _562 + _554;
    float _566 = -_378;
    float _568 = _566 + _556;
    float _570 = _560 + _462;
    float _572 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _574 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _576 = -_372;
    float _578 = _576 + _558;
    float _580 = _570 * _472;
    float _582 = _580 * 0.5;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].y, _572);
    float _586 = fma(_452, -2.0, _500);
    float _588 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _592);
    float _596 = fma(_452, -2.0, _498);
    float _598 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].y, _584);
    float _600 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _602 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _604 = fma(_444, -2.0, _498);
    float _606 = _598 * _456;
    float _608 = _598 * _596;
    float _610 = _598 * _468;
    float _612 = 1.0 / _594;
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _616 = fma(_602, _586, _606);
    float _618 = fma(_602, _458, _608);
    float _620 = fma(_602, _478, _610);
    float _622 = _620;
    if (_402)
    {
        _492 = 1.0;
    }
    float _624 = _492;
    float _626 = fma(_614, _474, _616);
    float _628 = fma(_614, _466, _618);
    float _630 = fma(_614, _604, _620);
    float _632 = _378 + _626;
    float _634 = _410 + _628;
    float _636 = _372 + _630;
    float _638 = _634;
    float _640 = _632;
    float _642 = _636;
    float _644 = _630;
    float _646 = _624;
    float _648 = _626;
    if (!_426)
    {
        float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _652 = _410 + _650;
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _656 = _378 + _654;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _660 = _652 * _652;
        float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _664 = _372 + _662;
        float _666 = fma(_656, _656, _660);
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _670 = fma(_664, _664, _666);
        float _672 = sqrt(_670);
        float _674 = _658 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _676 = precise::min(_672, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _678 = _676 * _668;
        float _680 = _674 * _678;
        float _682 = fma(_628, _680, _410);
        float _684 = fma(_626, _680, _378);
        float _686 = fma(_630, _680, _372);
        _638 = _682;
        _640 = _684;
        _642 = _686;
        _622 = _678;
    }
    float _688 = _638;
    float _690 = _640;
    float _692 = _642;
    float _694 = _622;
    float _696 = 0.0;
    float _698 = _694;
    if (_402)
    {
        _696 = 1.0;
    }
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _704 = _612 * _702;
    float _706 = _700;
    if (!_402)
    {
        float _708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _710 = _708 * 0.15915493667125701904296875;
        float _712 = _710 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _718 = _716 * 0.15915493667125701904296875;
        float _720 = _710 * 6.283185482025146484375;
        float _722 = sin(_720);
        float _724 = 1.0 / _714;
        float _726 = _718 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _722 * _724;
        float _732 = _718 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _738 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _736;
        float _740 = _728 * _730;
        float _742 = 1.0 / _740;
        float _744 = 1.0 / _738;
        float _746 = _734 * _742;
        float _748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _750 = fma(_704, _746, _748);
        float _752 = _750 * _744;
        float _754 = precise::clamp(_752, 0.0, 1.0);
        _644 = _718;
        _698 = _750;
        _646 = _754;
    }
    float _756 = _644;
    float _758 = _698;
    float _760 = _646;
    float _762 = _758;
    float _764 = _756;
    if (!_402)
    {
        float _766 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _768 = _766 * 0.15915493667125701904296875;
        float _770 = _768 * 6.283185482025146484375;
        float _772 = cos(_770);
        float _774 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _768 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = 1.0 / _772;
        float _784 = _776 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _780 * _782;
        float _790 = _776 * 6.283185482025146484375;
        float _792 = sin(_790);
        float _794 = _786 * _788;
        float _796 = 1.0 / _794;
        float _798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _800 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _798;
        float _802 = 1.0 / _800;
        float _804 = _792 * _796;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _808 = fma(_704, _804, _806);
        float _810 = _808 * _802;
        float _812 = precise::clamp(_810, 0.0, 1.0);
        float _814 = -_812;
        float _816 = _814 + 1.0;
        _762 = _796;
        _764 = _782;
        _706 = _816;
    }
    float _818 = _762;
    float _820 = _764;
    float _822 = _706;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _688 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _690 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _834 = _692 + _832;
    float _836 = _826 * _826;
    float _838 = fma(_830, _830, _836);
    float _840 = fma(_834, _834, _838);
    float _842 = rsqrt(_840);
    float _844 = sqrt(_840);
    float _846 = _842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _848 = _830 * _846;
    float _850 = _834 * _846;
    float _852 = _848 * _848;
    float _854 = _850 * _850;
    float _856 = _852 + _854;
    float _858 = sqrt(_856);
    bool _860 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = _858 + _862;
    float _866 = _842;
    float _868 = _820;
    float _870 = _864;
    float _872 = _846;
    float _874 = _826;
    if (_860)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _876;
    }
    float _878 = _866;
    if (_860)
    {
        float _880 = rsqrt(_856);
        _868 = _880;
    }
    float _882 = _868;
    float _884 = _882;
    if (_860)
    {
        float _886 = _864 * _878;
        _870 = _886;
    }
    float _888 = _870;
    if (_860)
    {
        float _890 = _888 * 0.15915493667125701904296875;
        _648 = _890;
    }
    float _892 = _648;
    float _894 = _818;
    if (_860)
    {
        float _896 = _892 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _904 = precise::max(0.0, _902);
    float _906 = _834;
    float _908 = _902;
    float _910 = _904;
    if (_860)
    {
        float _912 = _892 * 6.283185482025146484375;
        float _914 = cos(_912);
        _906 = _914;
    }
    float _916 = _906;
    float _918 = -_846;
    float _920 = -_904;
    float _922 = fma(_826, _918, _920);
    if (_860)
    {
        float _924 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _924;
    }
    float _926 = _908;
    float _928 = _900;
    if (_860)
    {
        float _930 = fma(_900, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _930;
    }
    float _932 = _872;
    float _934 = _932;
    if (!_860)
    {
        _928 = _922;
    }
    float _936 = _928;
    float _938 = _936;
    float _940 = _916;
    if (_860)
    {
        float _942 = _916 + (-1.0);
        _874 = _942;
    }
    float _944 = _874;
    float _946 = _944;
    if (_860)
    {
        float _948 = _882 * _932;
        _516 = _948;
    }
    float _950 = _516;
    if (!_860)
    {
        _884 = _848;
    }
    float _952 = _884;
    float _954 = _952;
    if (_860)
    {
        float _956 = _944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _956;
    }
    float _958 = _910;
    if (_860)
    {
        float _960 = _848 * _950;
        _954 = _960;
    }
    float _962 = _954;
    if (!_860)
    {
        _946 = _850;
    }
    float _964 = _946;
    float _966 = _964;
    if (_860)
    {
        float _968 = _850 * _950;
        _966 = _968;
    }
    float _970 = _966;
    if (_860)
    {
        float _972 = fma(_922, _916, _958);
        _938 = _972;
    }
    float _974 = _938;
    if (!_860)
    {
        _940 = _852;
    }
    float _976 = _940;
    float _978 = _976;
    if (_860)
    {
        float _980 = _962 * _962;
        _978 = _980;
    }
    float _982 = _978;
    if (!_860)
    {
        _934 = _854;
    }
    float _984 = _934;
    float _986 = _984;
    if (_860)
    {
        float _988 = _970 * _970;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_974, _974, _982);
    float _994 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _998 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1000 = _992 + _990;
    float _1002 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _996);
    float _1012 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = rsqrt(_1000);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1024 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1026 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1030 = floor(_998);
    float _1032 = fma(_372, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1036 = -_1028;
    float _1038 = fma(_1036, _1020, 1.0);
    float _1040 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1044 = _1014 * _962;
    float _1046 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1048 = abs(_1018);
    float _1050 = log2(_1048);
    float _1052 = _1014 * _974;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1056 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    float _1058 = _1014 * _970;
    float _1060 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = -_1054;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = floor(_1032);
    float _1070 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1042);
    float _1072 = -_1058;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1076 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1078 = -_1030;
    float _1080 = _998 + _1078;
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1084 = fma(_1074, -0.5, 0.5);
    float _1086 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = log2(_1038);
    float _1092 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1096 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1098 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1092);
    float _1100 = fma(_1074, 0.5, 0.5);
    float _1102 = -_1068;
    float _1104 = _1032 + _1102;
    float _1106 = exp2(_1088);
    float _1108 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1096);
    float _1110 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float2 _3540 = float2(_1080, _1104);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3540, float2(0.0), isnan(_3540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3540, float2(0.0), isnan(_3540)), level(0.0)).x;
    float _1114 = fma(_1100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1108);
    float _1118 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1120 = 1.0 / _1094;
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1116);
    float _1124 = fma(_1100, _1114, -0.212114393711090087890625);
    float _1126 = _1090 * 0.693147182464599609375;
    float _1128 = fma(_1100, _1124, 1.570728778839111328125);
    float _1130 = sqrt(_1084);
    float _1132 = _1122 * _1120;
    float _1134 = _1052 + 1.0;
    float _1136 = -_1052;
    float _1138 = fma(_1106, _1134, _1136);
    float _1140 = _1118 * _1120;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1144 = _1130 * 0.636619746685028076171875;
    float _1146 = fma(_1132, -0.5, 0.5);
    float _1148 = fma(_1140, 0.5, 0.5);
    float _1150 = fma(_1138, 0.5, 0.5);
    float _1152 = -_1128;
    float _1154 = fma(_1144, _1152, 1.0);
    float3 _3617 = float3(_1148, _1146, _1142);
    float _1156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1148, _1146, _1142);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3644 = float2(_1154, _1150);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3644, float2(0.0), isnan(_3644)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3644, float2(0.0), isnan(_3644)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_68.y;
    float _1181 = abs(_704);
    float _1183 = log2(_1181);
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    float _1189 = in.m_60.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1193 = _1191 != 0;
    float _1195 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = in.m_68.x;
    float _1199 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    out.m_70.x = 1.0;
    out.m_70.y = 1.0;
    out.m_70.z = 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1203 = _1144;
    float _1205 = _1201;
    float _1207 = _1197;
    float _1209 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1187)
    {
        float _1211 = in.m_60.x;
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1215);
    float _1219 = in.m_72.x;
    float _1221 = in.m_72.y;
    float _1223 = in.m_72.z;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1227 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1217);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1231 = -_1179;
    float _1233 = _1231 + 1.0;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = _372 + _1227;
    float _1239 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1241 = _1189 > 0.5;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1179;
    if (_1193)
    {
        float _1249 = _1241 ? _1233 : _1179;
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1255 = _221 != 0.0;
    bool _1257 = isnan(_221);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1267 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1269 = _219 == 0.0;
    bool _1271 = !_1263;
    bool _1273 = _1269 && _1271;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1187;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1283 = _223 == 0.0;
    bool _1285 = _1283 && _1273;
    float _1287 = exp2(_1239);
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1293 = _704 <= 8000.0;
    bool _1295 = isnan(_704);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(8000.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_74.x = _1245;
    out.m_74.y = _1253;
    out.m_74.z = _1289;
    out.m_74.w = _1265;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1307);
    if (_1187)
    {
        _1205 = _1197;
    }
    float _1311 = _1205;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1315 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1323 = _1319 || _1321;
    float _1325 = _1221;
    float _1327 = _1219;
    float _1329 = _1223;
    float _1331 = _1311;
    if (!_1285)
    {
        float _1333 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1325 = _1333;
    }
    float _1335 = _1325;
    if (!_1285)
    {
        float _1337 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1327 = _1337;
    }
    float _1339 = _1327;
    float _1341 = _1339;
    if (!_1285)
    {
        float _1343 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1329 = _1343;
    }
    float _1345 = _1329;
    out.m_76.x = _1267;
    out.m_76.y = _1275;
    out.m_76.z = _1313;
    float _1347 = -_1237;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1351 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1309);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1279)
    {
        float _1355 = -_1311;
        float _1357 = _1355 + 1.0;
        _1331 = _1357;
    }
    float _1359 = _1331;
    bool _1361 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1363 = isnan(_844);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1369 = _1365 || _1367;
    float _1371 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1373 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = precise::min(_1237, _1349);
    float _1377 = _378 + _1351;
    if (_1187)
    {
        _1207 = _1359;
    }
    float _1379 = _1207;
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1383 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1371);
    float _1387 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1389 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1391 = -_1377;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1395 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1385);
    float _1397 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1387);
    float _1399 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1389);
    float _1401 = fma(_1287, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = precise::min(_1377, _1393);
    float _1407 = _1397 * _456;
    float _1409 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1411 = fma(_1403, -2.0, 3.0);
    float _1413 = _1403 * _1403;
    float _1415 = in.m_78.x;
    float _1417 = precise::min(_1405, _1375);
    float _1419 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1421 = _1413 * _1411;
    float _1423 = _1397 * _596;
    float _1425 = _1397 * _468;
    float _1427 = _1419 * _1381;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1409 * _1353;
    float _1435 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1199);
    float _1437 = fma(_1395, _458, _1423);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1421);
    float _1441 = exp2(_1291);
    out.m_80.x = _1433;
    out.m_80.y = _1427;
    float _1443 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1435);
    float _1445 = _1303 * _1439;
    float _1447 = fma(_1395, _478, _1425);
    if (_1323)
    {
        float _1449 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1209 = _1449;
    }
    float _1451 = _1209;
    float _1453 = _1443 + _1094;
    float _1455 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1457 = _1451;
    float _1459 = _1094;
    if (_1323)
    {
        float _1461 = precise::min(_1451, 20.0);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = fma(_1395, _586, _1407);
    float _1467 = _1453 * 0.5;
    float _1469 = fma(_1399, _466, _1437);
    float _1471 = fma(_1399, _474, _1465);
    float _1473 = _1463;
    if (_1323)
    {
        float _1475 = 1.0 / _1463;
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = fma(_1399, _604, _1447);
    out.m_82.z = _1467;
    out.m_82.w = _1094;
    float _1481 = -_1441;
    float _1483 = _1481 + 1.0;
    out.m_84.x = _1471;
    out.m_84.y = _1469;
    out.m_84.z = _1479;
    float _1485 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1323)
    {
        _1341 = 1.0;
    }
    float _1487 = _1341;
    out.gl_Position.x = _1118;
    out.gl_Position.y = _1122;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1094;
    float _1489 = _1487;
    if (!_1369)
    {
        _494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1491 = _494;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1369)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1497 = _1459;
    float _1499 = _1497;
    float _1501 = _1497;
    if (_1323)
    {
        float _1503 = _1417 * _1477;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1489 = _1505;
    }
    float _1507 = _1489;
    float _1509 = -_1112;
    float _1511 = _1509 + 1.0;
    float _1513 = _1511 * _1455;
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = -_1515;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1521 = _760 * _822;
    float _1523 = _1519 * _1415;
    float _1525 = _1521 * _1507;
    float _1527 = _1521;
    float _1529 = _1523;
    float _1531 = _1525;
    if (!_1369)
    {
        _1527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _1527;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1539 = _1533;
    float _1541 = _1533;
    if (!_1369)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1369)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1531;
    out.m_86.x = _1535;
    float _1551 = _1485 * _1156;
    float _1553 = -_1485;
    float _1555 = _1553 + 1.0;
    float _1557 = _1167 * _1551;
    float _1559 = _1177 * _1551;
    float _1561 = _1167 * _1555;
    float _1563 = fma(_1173, _1557, _1161);
    float _1565 = fma(_1175, _1557, _1163);
    float _1567 = fma(_1167, _1559, _1165);
    out.m_88.x = _1563;
    out.m_88.y = _1565;
    out.m_88.z = _1567;
    out.m_88.w = _1561;
    float _1569 = _1563;
    float _1571 = _1549;
    float _1573 = _1549;
    if (!_1369)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1575 = _1569;
    bool _1577 = !_1369;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_844);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _844 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1605 = 1.0 / _1599;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1605;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1631 = fma(_1625, _1603, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1501 = _1637;
            _1573 = _1639;
            _1547 = _1635;
            _1541 = _1631;
            _1495 = _1633;
            _1581 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_844);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1545;
            _1547 = _1655;
            if (!_1653)
            {
                _1499 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1499;
            _1501 = _1657;
            if (!_1653)
            {
                _1493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1493;
            _1495 = _1659;
            if (!_1653)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1539;
            _1541 = _1661;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1571;
            _1573 = _1663;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1579;
            bool _1667 = !_1653;
            _1581 = _1665;
            if (!_1667)
            {
                bool _1669 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_844);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _844 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1691 = 1.0 / _1685;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1691;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1717 = fma(_1711, _1689, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1501 = _1723;
                    _1573 = _1725;
                    _1547 = _1721;
                    _1541 = _1717;
                    _1495 = _1719;
                    _1581 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1501 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1501;
    float _1731 = _1573;
    float _1733 = _1547;
    float _1735 = _1541;
    float _1737 = _1495;
    float _1739 = _1581;
    float _1741 = fma(_1469, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    float _1755 = fma(_1743, _1747, _1729);
    out.m_90.x = 0.0;
    float _1757 = -_1737;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1743, _1753, _1733);
    float _1763 = _1755 * 0.586610972881317138671875;
    out.m_56.x = _1749;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1759, _1737);
    float _1769 = fma(_1761, 0.298911988735198974609375, _1763);
    bool _1771 = _760 > 0.0;
    bool _1773 = isnan(_760);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    bool _1783 = _822 <= 0.0;
    bool _1785 = !_1779;
    bool _1787 = _1783 || _1785;
    float _1789 = -_1781;
    float _1791 = _1761 + _1789;
    float _1793 = -_1781;
    float _1795 = _1755 + _1793;
    float _1797 = -_1781;
    float _1799 = _1767 + _1797;
    float _1801 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1805 = fma(_1799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1807 = !_1765;
    if (!_1807)
    {
        float _1809 = -_688;
        float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1813 = -_690;
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1817 = -_692;
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1821 = _1811 * _1811;
        float _1823 = fma(_1815, _1815, _1821);
        float _1825 = fma(_1819, _1819, _1823);
        float _1827 = sqrt(_1825);
        float _1829 = rsqrt(_1825);
        float _1831 = -_1827;
        float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1815 * _1829;
        float _1841 = _1811 * _1829;
        float _1843 = abs(_1837);
        float _1845 = log2(_1843);
        float _1847 = _1819 * _1829;
        float _1849 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1851 = _1469 * _1841;
        float _1853 = -_1841;
        float _1855 = -_1849;
        float _1857 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1855);
        float _1859 = fma(_1471, _1839, _1851);
        float _1861 = -_1847;
        float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1857);
        float _1865 = fma(_1479, _1847, _1859);
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1871 = _1863 + _1869;
        float _1873 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1877 = precise::clamp(_1875, 0.0, 1.0);
        float _1879 = exp2(_1873);
        float _1881 = _1879 * _1877;
        float _1883 = _1867 * _1881;
        float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _1885;
        out.m_90.y = _1887;
        out.m_90.z = _1889;
    }
    out.m_92.x = _1801;
    out.m_92.y = _1803;
    out.m_92.z = _1805;
    if (!_1787)
    {
        return out;
    }
    out.m_56.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1643 = false;
    bool _187 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_53.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (!_115)
    {
        out.m_56.x = 0.0;
    }
    int _121 = 0;
    if (!_115)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_125);
        out.gl_Position.z = _1947;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_58.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    if (_139)
    {
        float _147 = float(_111);
        _145 = _147;
    }
    float _149 = _145;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = 0.0;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_56.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_163);
        out.gl_Position.z = _2015;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _167 = !_165;
    float _185;
    if (!_167)
    {
        float _169 = in.m_60.x;
        float _171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _175 = fma(_173, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _177 = _175 * _171;
        float _179 = floor(_177);
        float _181 = -_179;
        float _183 = _177 + _181;
        _185 = _183;
        _187 = true;
    }
    else
    {
        float _189 = float(_111);
        float _191 = 1.0 / _189;
        float _193 = _143 * _191;
        _185 = _193;
    }
    _187 = false;
    float _195 = _185;
    float _197 = in.m_62.w;
    float _199 = trunc(_197);
    int _201 = int(_199);
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _195 + _203;
    bool _207 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _209 = isnan(_195);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = in.m_64.x;
    float _221 = in.m_64.y;
    float _223 = in.m_64.z;
    int _225 = _201 << 5;
    uint _228 = uint(int(uint(_225) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_228)];
    float _230 = as_type<float>(_dmw0.x);
    int _232 = _225 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>(_dmw0.y);
    int _238 = _225 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>(_dmw0.z);
    int _244 = _225 + 12;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>(_dmw0.w);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _250;
    bool _254 = _195 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _256 = isnan(_195);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -_217;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _252;
    float _272 = _264 * _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = _205 * _270;
    float _292 = in.m_66.x;
    float _294 = in.m_66.y;
    float _296 = in.m_66.z;
    float _298 = fma(_280, _290, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _300 = fma(_288, _290, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = fma(_284, _290, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _304 = in.m_53.x;
    float _306 = in.m_53.y;
    float _308 = in.m_53.z;
    float _310 = _298 * _272;
    float _312 = _300 * _272;
    float _314 = _302 * _272;
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _310);
    float _318 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _314);
    float _320 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _312);
    float _322 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].x, _316);
    float _324 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].y, _318);
    float _326 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[144].z, _320);
    float _328 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _223);
    float _332 = _322 * _292;
    float _334 = _324 * _294;
    float _336 = _326 * _296;
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _340 = _332 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _342 = _334 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _344 = _336 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _346 = _340 * _338;
    float _348 = _306 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _342 * _328;
    float _352 = _344 * _330;
    float _354 = _306 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _356 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _350 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _360 = _350 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _362 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[4].x, _354);
    float _364 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[10].x, _358);
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[8].x, _360);
    float _370 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[4].z, _362);
    float _372 = _364 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _374 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[10].z, _366);
    float _376 = _306 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _378 = _370 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _380 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[8].z, _368);
    float _382 = _372 + _374;
    float _384 = fma(_304, (*spvDescriptorSet0.vp_c10)._m0[5].x, _376);
    float _386 = _378 + _380;
    float _388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _390 = _382 + _388;
    float _392 = fma(_308, (*spvDescriptorSet0.vp_c10)._m0[5].z, _384);
    bool _394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _398 = _394 || _396;
    bool _400 = isnan(0.5);
    bool _402 = _398 || _400;
    float _404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _406 = _386 + _404;
    float _408 = _390 * _390;
    float _410 = _392 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _412 = fma(_406, _406, _408);
    float _414 = _410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _416 = _350 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _418 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _420 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _422 = _418 || _420;
    bool _424 = isnan(0.5);
    bool _426 = _422 || _424;
    float _428 = sqrt(_412);
    float _430 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _414);
    float _432 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[9].x, _416);
    float _434 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _430);
    bool _436 = _428 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _438 = _248 * 2.0;
    float _440 = _230 * 2.0;
    float _442 = _236 * 2.0;
    float _444 = _236 * _236;
    float _446 = _242 * _438;
    float _448 = _230 * _438;
    float _450 = _236 * _438;
    float _452 = _242 * _242;
    float _454 = -_446;
    float _456 = fma(_236, _440, _454);
    float _458 = fma(_236, _440, _446);
    float _460 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[9].z, _432);
    float _462 = _434 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _464 = -_448;
    float _466 = fma(_242, _442, _464);
    float _468 = fma(_242, _442, _448);
    float _470 = _410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _472 = 1.0 / _462;
    float _474 = fma(_242, _440, _450);
    float _476 = -_450;
    float _478 = fma(_242, _440, _476);
    float _480 = _230 * _230;
    float _482 = _410 + _460;
    float _484 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _470);
    float _486 = _236;
    float _488 = _480;
    float _490 = _460;
    float _492 = _434;
    float _494 = _474;
    if (!_436)
    {
        _486 = _382;
    }
    float _496 = _486;
    float _498 = fma(_480, -2.0, 1.0);
    float _500 = fma(_444, -2.0, 1.0);
    float _502 = fma(_372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _484);
    float _504 = _496;
    if (!_436)
    {
        _488 = _386;
    }
    float _506 = _488;
    float _508 = _506;
    if (!_436)
    {
        _490 = _482;
    }
    float _510 = _490;
    bool _512 = !_436;
    float _514 = _510;
    float _516 = _472;
    if (!_512)
    {
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _522 = _428 + _520;
        float _524 = rsqrt(_412);
        float _526 = _522 * _518;
        float _528 = _482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _530 = _526 * 0.15915493667125701904296875;
        float _532 = _530 * 6.283185482025146484375;
        float _534 = cos(_532);
        float _536 = _530 * 6.283185482025146484375;
        float _538 = sin(_536);
        float _540 = _534 + (-1.0);
        float _542 = fma(_538, _528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _544 = _540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _546 = _524 * _542;
        float _548 = fma(_482, _534, _544);
        float _550 = fma(_406, _546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _552 = fma(_390, _546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _514 = _548;
        _508 = _550;
        _504 = _552;
    }
    float _554 = _514;
    float _556 = _508;
    float _558 = _504;
    float _560 = _502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _562 = -_410;
    float _564 = _562 + _554;
    float _566 = -_378;
    float _568 = _566 + _556;
    float _570 = _560 + _462;
    float _572 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _574 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _576 = -_372;
    float _578 = _576 + _558;
    float _580 = _570 * _472;
    float _582 = _580 * 0.5;
    float _584 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].y, _572);
    float _586 = fma(_452, -2.0, _500);
    float _588 = _564 * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].x, _574);
    float _592 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[30].w, _592);
    float _596 = fma(_452, -2.0, _498);
    float _598 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].y, _584);
    float _600 = fma(_568, (*spvDescriptorSet0.vp_c10)._m0[4].z, _588);
    float _602 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].x, _590);
    float _604 = fma(_444, -2.0, _498);
    float _606 = _598 * _456;
    float _608 = _598 * _596;
    float _610 = _598 * _468;
    float _612 = 1.0 / _594;
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[6].z, _600);
    float _616 = fma(_602, _586, _606);
    float _618 = fma(_602, _458, _608);
    float _620 = fma(_602, _478, _610);
    float _622 = _620;
    if (_402)
    {
        _492 = 1.0;
    }
    float _624 = _492;
    float _626 = fma(_614, _474, _616);
    float _628 = fma(_614, _466, _618);
    float _630 = fma(_614, _604, _620);
    float _632 = _378 + _626;
    float _634 = _410 + _628;
    float _636 = _372 + _630;
    float _638 = _634;
    float _640 = _632;
    float _642 = _636;
    float _644 = _630;
    float _646 = _624;
    float _648 = _626;
    if (!_426)
    {
        float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _652 = _410 + _650;
        float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _656 = _378 + _654;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _660 = _652 * _652;
        float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _664 = _372 + _662;
        float _666 = fma(_656, _656, _660);
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _670 = fma(_664, _664, _666);
        float _672 = sqrt(_670);
        float _674 = _658 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _676 = precise::min(_672, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _678 = _676 * _668;
        float _680 = _674 * _678;
        float _682 = fma(_628, _680, _410);
        float _684 = fma(_626, _680, _378);
        float _686 = fma(_630, _680, _372);
        _638 = _682;
        _640 = _684;
        _642 = _686;
        _622 = _678;
    }
    float _688 = _638;
    float _690 = _640;
    float _692 = _642;
    float _694 = _622;
    float _696 = 0.0;
    float _698 = _694;
    if (_402)
    {
        _696 = 1.0;
    }
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _704 = _612 * _702;
    float _706 = _700;
    if (!_402)
    {
        float _708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _710 = _708 * 0.15915493667125701904296875;
        float _712 = _710 * 6.283185482025146484375;
        float _714 = cos(_712);
        float _716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _718 = _716 * 0.15915493667125701904296875;
        float _720 = _710 * 6.283185482025146484375;
        float _722 = sin(_720);
        float _724 = 1.0 / _714;
        float _726 = _718 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = _722 * _724;
        float _732 = _718 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _738 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _736;
        float _740 = _728 * _730;
        float _742 = 1.0 / _740;
        float _744 = 1.0 / _738;
        float _746 = _734 * _742;
        float _748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _750 = fma(_704, _746, _748);
        float _752 = _750 * _744;
        float _754 = precise::clamp(_752, 0.0, 1.0);
        _644 = _718;
        _698 = _750;
        _646 = _754;
    }
    float _756 = _644;
    float _758 = _698;
    float _760 = _646;
    float _762 = _758;
    float _764 = _756;
    if (!_402)
    {
        float _766 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _768 = _766 * 0.15915493667125701904296875;
        float _770 = _768 * 6.283185482025146484375;
        float _772 = cos(_770);
        float _774 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _768 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = 1.0 / _772;
        float _784 = _776 * 6.283185482025146484375;
        float _786 = cos(_784);
        float _788 = _780 * _782;
        float _790 = _776 * 6.283185482025146484375;
        float _792 = sin(_790);
        float _794 = _786 * _788;
        float _796 = 1.0 / _794;
        float _798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _800 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _798;
        float _802 = 1.0 / _800;
        float _804 = _792 * _796;
        float _806 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _808 = fma(_704, _804, _806);
        float _810 = _808 * _802;
        float _812 = precise::clamp(_810, 0.0, 1.0);
        float _814 = -_812;
        float _816 = _814 + 1.0;
        _762 = _796;
        _764 = _782;
        _706 = _816;
    }
    float _818 = _762;
    float _820 = _764;
    float _822 = _706;
    float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _826 = _688 + _824;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _830 = _690 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _834 = _692 + _832;
    float _836 = _826 * _826;
    float _838 = fma(_830, _830, _836);
    float _840 = fma(_834, _834, _838);
    float _842 = rsqrt(_840);
    float _844 = sqrt(_840);
    float _846 = _842 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _848 = _830 * _846;
    float _850 = _834 * _846;
    float _852 = _848 * _848;
    float _854 = _850 * _850;
    float _856 = _852 + _854;
    float _858 = sqrt(_856);
    bool _860 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _862 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = _858 + _862;
    float _866 = _842;
    float _868 = _820;
    float _870 = _864;
    float _872 = _846;
    float _874 = _826;
    if (_860)
    {
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _866 = _876;
    }
    float _878 = _866;
    if (_860)
    {
        float _880 = rsqrt(_856);
        _868 = _880;
    }
    float _882 = _868;
    float _884 = _882;
    if (_860)
    {
        float _886 = _864 * _878;
        _870 = _886;
    }
    float _888 = _870;
    if (_860)
    {
        float _890 = _888 * 0.15915493667125701904296875;
        _648 = _890;
    }
    float _892 = _648;
    float _894 = _818;
    if (_860)
    {
        float _896 = _892 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _904 = precise::max(0.0, _902);
    float _906 = _834;
    float _908 = _902;
    float _910 = _904;
    if (_860)
    {
        float _912 = _892 * 6.283185482025146484375;
        float _914 = cos(_912);
        _906 = _914;
    }
    float _916 = _906;
    float _918 = -_846;
    float _920 = -_904;
    float _922 = fma(_826, _918, _920);
    if (_860)
    {
        float _924 = _922 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _908 = _924;
    }
    float _926 = _908;
    float _928 = _900;
    if (_860)
    {
        float _930 = fma(_900, _926, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _872 = _930;
    }
    float _932 = _872;
    float _934 = _932;
    if (!_860)
    {
        _928 = _922;
    }
    float _936 = _928;
    float _938 = _936;
    float _940 = _916;
    if (_860)
    {
        float _942 = _916 + (-1.0);
        _874 = _942;
    }
    float _944 = _874;
    float _946 = _944;
    if (_860)
    {
        float _948 = _882 * _932;
        _516 = _948;
    }
    float _950 = _516;
    if (!_860)
    {
        _884 = _848;
    }
    float _952 = _884;
    float _954 = _952;
    if (_860)
    {
        float _956 = _944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _956;
    }
    float _958 = _910;
    if (_860)
    {
        float _960 = _848 * _950;
        _954 = _960;
    }
    float _962 = _954;
    if (!_860)
    {
        _946 = _850;
    }
    float _964 = _946;
    float _966 = _964;
    if (_860)
    {
        float _968 = _850 * _950;
        _966 = _968;
    }
    float _970 = _966;
    if (_860)
    {
        float _972 = fma(_922, _916, _958);
        _938 = _972;
    }
    float _974 = _938;
    if (!_860)
    {
        _940 = _852;
    }
    float _976 = _940;
    float _978 = _976;
    if (_860)
    {
        float _980 = _962 * _962;
        _978 = _980;
    }
    float _982 = _978;
    if (!_860)
    {
        _934 = _854;
    }
    float _984 = _934;
    float _986 = _984;
    if (_860)
    {
        float _988 = _970 * _970;
        _986 = _988;
    }
    float _990 = _986;
    float _992 = fma(_974, _974, _982);
    float _994 = _688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _996 = _688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _998 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1000 = _992 + _990;
    float _1002 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _994);
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _996);
    float _1012 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1002);
    float _1014 = rsqrt(_1000);
    float _1016 = -_1008;
    float _1018 = _1016 + 1.0;
    float _1020 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1022 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1024 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1010);
    float _1026 = _688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1028 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1030 = floor(_998);
    float _1032 = fma(_372, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1036 = -_1028;
    float _1038 = fma(_1036, _1020, 1.0);
    float _1040 = _688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1026);
    float _1044 = _1014 * _962;
    float _1046 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1048 = abs(_1018);
    float _1050 = log2(_1048);
    float _1052 = _1014 * _974;
    float _1054 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1056 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1046);
    float _1058 = _1014 * _970;
    float _1060 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1062 = -_1054;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1062);
    float _1066 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1068 = floor(_1032);
    float _1070 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1042);
    float _1072 = -_1058;
    float _1074 = fma(_1072, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1064);
    float _1076 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1060);
    float _1078 = -_1030;
    float _1080 = _998 + _1078;
    float _1082 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1084 = fma(_1074, -0.5, 0.5);
    float _1086 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = log2(_1038);
    float _1092 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1094 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1096 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1098 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1092);
    float _1100 = fma(_1074, 0.5, 0.5);
    float _1102 = -_1068;
    float _1104 = _1032 + _1102;
    float _1106 = exp2(_1088);
    float _1108 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1096);
    float _1110 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1098);
    float2 _3540 = float2(_1080, _1104);
    float _1112 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3540, float2(0.0), isnan(_3540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3540, float2(0.0), isnan(_3540)), level(0.0)).x;
    float _1114 = fma(_1100, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1108);
    float _1118 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1110);
    float _1120 = 1.0 / _1094;
    float _1122 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1116);
    float _1124 = fma(_1100, _1114, -0.212114393711090087890625);
    float _1126 = _1090 * 0.693147182464599609375;
    float _1128 = fma(_1100, _1124, 1.570728778839111328125);
    float _1130 = sqrt(_1084);
    float _1132 = _1122 * _1120;
    float _1134 = _1052 + 1.0;
    float _1136 = -_1052;
    float _1138 = fma(_1106, _1134, _1136);
    float _1140 = _1118 * _1120;
    float _1142 = _1126 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1144 = _1130 * 0.636619746685028076171875;
    float _1146 = fma(_1132, -0.5, 0.5);
    float _1148 = fma(_1140, 0.5, 0.5);
    float _1150 = fma(_1138, 0.5, 0.5);
    float _1152 = -_1128;
    float _1154 = fma(_1144, _1152, 1.0);
    float3 _3617 = float3(_1148, _1146, _1142);
    float _1156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1148, _1146, _1142);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3644 = float2(_1154, _1150);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3644, float2(0.0), isnan(_3644)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3644, float2(0.0), isnan(_3644)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_68.y;
    float _1181 = abs(_704);
    float _1183 = log2(_1181);
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    float _1189 = in.m_60.y;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1193 = _1191 != 0;
    float _1195 = _1034 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1197 = in.m_68.x;
    float _1199 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1195);
    out.m_70.x = 1.0;
    out.m_70.y = 1.0;
    out.m_70.z = 1.0;
    float _1201 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1203 = _1144;
    float _1205 = _1201;
    float _1207 = _1197;
    float _1209 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_1187)
    {
        float _1211 = in.m_60.x;
        _1203 = _1211;
    }
    float _1213 = _1203;
    float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1217 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1215);
    float _1219 = in.m_72.x;
    float _1221 = in.m_72.y;
    float _1223 = in.m_72.z;
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1227 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1217);
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1231 = -_1179;
    float _1233 = _1231 + 1.0;
    float _1235 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1237 = _372 + _1227;
    float _1239 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1241 = _1189 > 0.5;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1245 = _1225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1247 = _1179;
    if (_1193)
    {
        float _1249 = _1241 ? _1233 : _1179;
        _1247 = _1249;
    }
    float _1251 = _1247;
    float _1253 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1255 = _221 != 0.0;
    bool _1257 = isnan(_221);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan(0.0);
    bool _1263 = _1259 || _1261;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1267 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1269 = _219 == 0.0;
    bool _1271 = !_1263;
    bool _1273 = _1269 && _1271;
    float _1275 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1277 = _1213 > 0.5;
    bool _1279 = _1277 && _1187;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1283 = _223 == 0.0;
    bool _1285 = _1283 && _1273;
    float _1287 = exp2(_1239);
    float _1289 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1293 = _704 <= 8000.0;
    bool _1295 = isnan(_704);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan(8000.0);
    bool _1301 = _1297 || _1299;
    float _1303 = float(_1301);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_74.x = _1245;
    out.m_74.y = _1253;
    out.m_74.z = _1289;
    out.m_74.w = _1265;
    float _1307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1307);
    if (_1187)
    {
        _1205 = _1197;
    }
    float _1311 = _1205;
    float _1313 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1315 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1317 = isnan(0.0);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1323 = _1319 || _1321;
    float _1325 = _1221;
    float _1327 = _1219;
    float _1329 = _1223;
    float _1331 = _1311;
    if (!_1285)
    {
        float _1333 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1221);
        _1325 = _1333;
    }
    float _1335 = _1325;
    if (!_1285)
    {
        float _1337 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1219);
        _1327 = _1337;
    }
    float _1339 = _1327;
    float _1341 = _1339;
    if (!_1285)
    {
        float _1343 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1223);
        _1329 = _1343;
    }
    float _1345 = _1329;
    out.m_76.x = _1267;
    out.m_76.y = _1275;
    out.m_76.z = _1313;
    float _1347 = -_1237;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1351 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1309);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1279)
    {
        float _1355 = -_1311;
        float _1357 = _1355 + 1.0;
        _1331 = _1357;
    }
    float _1359 = _1331;
    bool _1361 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1363 = isnan(_844);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1369 = _1365 || _1367;
    float _1371 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1373 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1375 = precise::min(_1237, _1349);
    float _1377 = _378 + _1351;
    if (_1187)
    {
        _1207 = _1359;
    }
    float _1379 = _1207;
    float _1381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1383 = _1335 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1385 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1371);
    float _1387 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1373);
    float _1389 = fma(_1339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1383);
    float _1391 = -_1377;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1395 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1385);
    float _1397 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1387);
    float _1399 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1389);
    float _1401 = fma(_1287, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1403 = precise::clamp(_1401, 0.0, 1.0);
    float _1405 = precise::min(_1377, _1393);
    float _1407 = _1397 * _456;
    float _1409 = _1379 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1411 = fma(_1403, -2.0, 3.0);
    float _1413 = _1403 * _1403;
    float _1415 = in.m_78.x;
    float _1417 = precise::min(_1405, _1375);
    float _1419 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1421 = _1413 * _1411;
    float _1423 = _1397 * _596;
    float _1425 = _1397 * _468;
    float _1427 = _1419 * _1381;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1409 * _1353;
    float _1435 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1199);
    float _1437 = fma(_1395, _458, _1423);
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1421);
    float _1441 = exp2(_1291);
    out.m_80.x = _1433;
    out.m_80.y = _1427;
    float _1443 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1435);
    float _1445 = _1303 * _1439;
    float _1447 = fma(_1395, _478, _1425);
    if (_1323)
    {
        float _1449 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1209 = _1449;
    }
    float _1451 = _1209;
    float _1453 = _1443 + _1094;
    float _1455 = _1445 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1457 = _1451;
    float _1459 = _1094;
    if (_1323)
    {
        float _1461 = precise::min(_1451, 20.0);
        _1457 = _1461;
    }
    float _1463 = _1457;
    float _1465 = fma(_1395, _586, _1407);
    float _1467 = _1453 * 0.5;
    float _1469 = fma(_1399, _466, _1437);
    float _1471 = fma(_1399, _474, _1465);
    float _1473 = _1463;
    if (_1323)
    {
        float _1475 = 1.0 / _1463;
        _1473 = _1475;
    }
    float _1477 = _1473;
    float _1479 = fma(_1399, _604, _1447);
    out.m_82.z = _1467;
    out.m_82.w = _1094;
    float _1481 = -_1441;
    float _1483 = _1481 + 1.0;
    out.m_84.x = _1471;
    out.m_84.y = _1469;
    out.m_84.z = _1479;
    float _1485 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1323)
    {
        _1341 = 1.0;
    }
    float _1487 = _1341;
    out.gl_Position.x = _1118;
    out.gl_Position.y = _1122;
    out.gl_Position.z = _1443;
    out.gl_Position.w = _1094;
    float _1489 = _1487;
    if (!_1369)
    {
        _494 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1491 = _494;
    float _1493 = _1491;
    float _1495 = _1491;
    if (!_1369)
    {
        _1459 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1497 = _1459;
    float _1499 = _1497;
    float _1501 = _1497;
    if (_1323)
    {
        float _1503 = _1417 * _1477;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1489 = _1505;
    }
    float _1507 = _1489;
    float _1509 = -_1112;
    float _1511 = _1509 + 1.0;
    float _1513 = _1511 * _1455;
    float _1515 = precise::clamp(_1513, 0.0, 1.0);
    float _1517 = -_1515;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1521 = _760 * _822;
    float _1523 = _1519 * _1415;
    float _1525 = _1521 * _1507;
    float _1527 = _1521;
    float _1529 = _1523;
    float _1531 = _1525;
    if (!_1369)
    {
        _1527 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1533 = _1527;
    float _1535 = _1523 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1539 = _1533;
    float _1541 = _1533;
    if (!_1369)
    {
        _1529 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1543 = _1529;
    float _1545 = _1543;
    float _1547 = _1543;
    if (!_1369)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1549 = _1531;
    out.m_86.x = _1535;
    float _1551 = _1485 * _1156;
    float _1553 = -_1485;
    float _1555 = _1553 + 1.0;
    float _1557 = _1167 * _1551;
    float _1559 = _1177 * _1551;
    float _1561 = _1167 * _1555;
    float _1563 = fma(_1173, _1557, _1161);
    float _1565 = fma(_1175, _1557, _1163);
    float _1567 = fma(_1167, _1559, _1165);
    out.m_88.x = _1563;
    out.m_88.y = _1565;
    out.m_88.z = _1567;
    out.m_88.w = _1561;
    float _1569 = _1563;
    float _1571 = _1549;
    float _1573 = _1549;
    if (!_1369)
    {
        _1569 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1575 = _1569;
    bool _1577 = !_1369;
    float _1579 = _1575;
    float _1581 = _1575;
    if (!_1577)
    {
        bool _1583 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1585 = isnan(_844);
        bool _1587 = _1583 || _1585;
        bool _1589 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1591 = _1587 || _1589;
        if (!_1591)
        {
            float _1593 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1595 = _844 + _1593;
            float _1597 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1599 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1603 = _1601 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1605 = 1.0 / _1599;
            float _1607 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1611 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1619 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1621 = _1619 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1623 = _1595 * _1605;
            float _1625 = precise::clamp(_1623, 0.0, 1.0);
            float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1629 = _1627 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1631 = fma(_1625, _1603, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1633 = fma(_1625, _1629, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1635 = fma(_1625, _1609, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1637 = fma(_1625, _1613, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1639 = fma(_1625, _1617, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1641 = fma(_1625, _1621, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1501 = _1637;
            _1573 = _1639;
            _1547 = _1635;
            _1541 = _1631;
            _1495 = _1633;
            _1581 = _1641;
            _1643 = true;
        }
        else
        {
            bool _1645 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1647 = isnan(_844);
            bool _1649 = _1645 || _1647;
            bool _1651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1653 = _1649 || _1651;
            if (!_1653)
            {
                _1545 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1655 = _1545;
            _1547 = _1655;
            if (!_1653)
            {
                _1499 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1657 = _1499;
            _1501 = _1657;
            if (!_1653)
            {
                _1493 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1659 = _1493;
            _1495 = _1659;
            if (!_1653)
            {
                _1539 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1661 = _1539;
            _1541 = _1661;
            if (!_1653)
            {
                _1571 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1663 = _1571;
            _1573 = _1663;
            if (!_1653)
            {
                _1579 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1665 = _1579;
            bool _1667 = !_1653;
            _1581 = _1665;
            if (!_1667)
            {
                bool _1669 = _844 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1671 = isnan(_844);
                bool _1673 = _1669 || _1671;
                bool _1675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1677 = _1673 || _1675;
                if (!_1677)
                {
                    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1681 = _844 + _1679;
                    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1685 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1683;
                    float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1691 = 1.0 / _1685;
                    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1705 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1707 = _1705 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1709 = _1681 * _1691;
                    float _1711 = precise::clamp(_1709, 0.0, 1.0);
                    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1717 = fma(_1711, _1689, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1719 = fma(_1711, _1715, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1721 = fma(_1711, _1695, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1723 = fma(_1711, _1699, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1725 = fma(_1711, _1703, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1727 = fma(_1711, _1707, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1501 = _1723;
                    _1573 = _1725;
                    _1547 = _1721;
                    _1541 = _1717;
                    _1495 = _1719;
                    _1581 = _1727;
                    _1643 = true;
                }
                else
                {
                    _1501 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1573 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1547 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1541 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1495 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1581 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1643 = false;
    float _1729 = _1501;
    float _1731 = _1573;
    float _1733 = _1547;
    float _1735 = _1541;
    float _1737 = _1495;
    float _1739 = _1581;
    float _1741 = fma(_1469, -0.5, 0.5);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = -_1729;
    float _1747 = _1745 + _1731;
    float _1749 = _1537 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1751 = -_1733;
    float _1753 = _1751 + _1735;
    float _1755 = fma(_1743, _1747, _1729);
    out.m_90.x = 0.0;
    float _1757 = -_1737;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1743, _1753, _1733);
    float _1763 = _1755 * 0.586610972881317138671875;
    out.m_56.x = _1749;
    bool _1765 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1767 = fma(_1743, _1759, _1737);
    float _1769 = fma(_1761, 0.298911988735198974609375, _1763);
    bool _1771 = _760 > 0.0;
    bool _1773 = isnan(_760);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.0);
    bool _1779 = _1775 || _1777;
    float _1781 = fma(_1767, 0.114477999508380889892578125, _1769);
    bool _1783 = _822 <= 0.0;
    bool _1785 = !_1779;
    bool _1787 = _1783 || _1785;
    float _1789 = -_1781;
    float _1791 = _1761 + _1789;
    float _1793 = -_1781;
    float _1795 = _1755 + _1793;
    float _1797 = -_1781;
    float _1799 = _1767 + _1797;
    float _1801 = fma(_1791, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    float _1805 = fma(_1799, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1781);
    bool _1807 = !_1765;
    if (!_1807)
    {
        float _1809 = -_688;
        float _1811 = _1809 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1813 = -_690;
        float _1815 = _1813 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1817 = -_692;
        float _1819 = _1817 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1821 = _1811 * _1811;
        float _1823 = fma(_1815, _1815, _1821);
        float _1825 = fma(_1819, _1819, _1823);
        float _1827 = sqrt(_1825);
        float _1829 = rsqrt(_1825);
        float _1831 = -_1827;
        float _1833 = _1831 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1837 = precise::clamp(_1835, 0.0, 1.0);
        float _1839 = _1815 * _1829;
        float _1841 = _1811 * _1829;
        float _1843 = abs(_1837);
        float _1845 = log2(_1843);
        float _1847 = _1819 * _1829;
        float _1849 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1851 = _1469 * _1841;
        float _1853 = -_1841;
        float _1855 = -_1849;
        float _1857 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1855);
        float _1859 = fma(_1471, _1839, _1851);
        float _1861 = -_1847;
        float _1863 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1857);
        float _1865 = fma(_1479, _1847, _1859);
        float _1867 = precise::clamp(_1865, 0.0, 1.0);
        float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1871 = _1863 + _1869;
        float _1873 = _1845 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1875 = _1871 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1877 = precise::clamp(_1875, 0.0, 1.0);
        float _1879 = exp2(_1873);
        float _1881 = _1879 * _1877;
        float _1883 = _1867 * _1881;
        float _1885 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1887 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1889 = _1883 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _1885;
        out.m_90.y = _1887;
        out.m_90.z = _1889;
    }
    out.m_92.x = _1801;
    out.m_92.y = _1803;
    out.m_92.z = _1805;
    if (!_1787)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_56.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

