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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _728 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1216 = as_type<float>(_104);
        out.gl_Position.z = _1216;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_140);
        out.gl_Position.z = _1284;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _266 = _258;
    float _268 = _262;
    float _286;
    if (!_264)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_88);
        float _292 = 1.0 / _290;
        float _294 = _122 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    bool _308 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_296);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = in.m_53.y;
    float _326 = 1.0 / _322;
    bool _328 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_318;
    float _342 = _340 + 1.0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _368 = _366 != 0;
    float _370 = _300 * _326;
    float _372 = in.m_55.x;
    float _374 = in.m_55.y;
    float _376 = in.m_55.z;
    float _378 = fma(_354, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = fma(_350, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_358, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = 0.0;
    if (_346)
    {
        float _386 = in.m_53.x;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = _378 * _360;
    float _392 = _380 * _360;
    float _394 = _382 * _360;
    bool _396 = _324 > 0.5;
    float _398 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _400 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _404 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].y, _398);
    float _406 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].x, _400);
    float _408 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].z, _402);
    float _410 = _404 * _304;
    float _412 = _406 * _302;
    float _414 = _408 * _306;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _420 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _372);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _376);
    float _424 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = _418 * _416;
    float _430 = _424 * _420;
    float _432 = _426 * _422;
    float _434 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _440 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _438);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _446);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _466 = in.m_57.y;
    float _468 = _458 + _462;
    float _470 = _460 + _464;
    float _472 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = in.m_57.x;
    float _476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _470 + _480;
    float _484 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _488 = _478 * _478;
    float _490 = _482 * _482;
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _484);
    float _494 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _498 = _488 + _490;
    float _500 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _492);
    float _502 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _506 = sqrt(_498);
    float _508 = -_466;
    float _510 = _508 + 1.0;
    float _512 = _502 + _504;
    float _514 = _466;
    float _516 = _388;
    float _518 = _484;
    float _520 = _510;
    float _522 = _468;
    float _524 = _432;
    if (_368)
    {
        float _526 = _396 ? _510 : _466;
        _514 = _526;
    }
    float _528 = _514;
    bool _530 = _388 > 0.5;
    bool _532 = _530 && _346;
    if (_346)
    {
        _516 = _474;
    }
    float _534 = _516;
    bool _536 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _538 = _534;
    if (!_536)
    {
        _266 = _468;
    }
    float _540 = _266;
    float _542 = _540;
    if (!_536)
    {
        _518 = _490;
    }
    float _544 = _518;
    float _546 = _544;
    if (!_536)
    {
        _520 = _488;
    }
    float _548 = _520;
    float _550 = _548;
    if (!_536)
    {
        _268 = _470;
    }
    float _552 = _268;
    float _554 = _552;
    if (!_536)
    {
        _522 = _512;
    }
    float _556 = _522;
    bool _558 = !_536;
    float _560 = _556;
    if (!_558)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _566 = _506 + _564;
        float _568 = rsqrt(_498);
        float _570 = _566 * _562;
        float _572 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * 0.15915493667125701904296875;
        float _576 = _574 * 6.283185482025146484375;
        float _578 = sin(_576);
        float _580 = _574 * 6.283185482025146484375;
        float _582 = cos(_580);
        float _584 = fma(_578, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _586 = _568 * _584;
        float _588 = _582 + (-1.0);
        float _590 = fma(_478, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _592 = fma(_482, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _594 = _588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _598 = _590 + _596;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _602 = _592 + _600;
        float _604 = fma(_512, _582, _594);
        float _606 = _598 * _598;
        float _608 = _602 * _602;
        _560 = _604;
        _550 = _606;
        _546 = _608;
        _542 = _590;
        _554 = _592;
    }
    float _610 = _560;
    float _612 = _550;
    float _614 = _546;
    float _616 = _542;
    float _618 = _554;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _622 = _610 + _620;
    float _624 = _616;
    if (_532)
    {
        float _626 = -_534;
        float _628 = _626 + 1.0;
        _538 = _628;
    }
    float _630 = _538;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_346)
    {
        _524 = _474;
    }
    float _634 = _524;
    float _636 = fma(_622, _622, _612);
    float _638 = _528 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = _634;
    if (_346)
    {
        _640 = _630;
    }
    float _642 = _640;
    float _644 = _636 + _614;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _650 = sqrt(_644);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _662 = _638 * _496;
    float _664 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _648 * _632;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _688 = _684 || _686;
    out.m_61.x = _668;
    out.m_61.y = _670;
    out.m_61.z = _672;
    out.m_61.w = _666;
    out.m_63.x = _664;
    out.m_63.y = _674;
    out.m_63.z = _676;
    out.m_65.x = _678;
    out.m_65.y = _662;
    float _690 = _648;
    float _692 = _664;
    if (!_688)
    {
        _690 = 1.0;
    }
    float _694 = _690;
    bool _696 = !_688;
    float _698 = _694;
    if (!_696)
    {
        bool _700 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _702 = isnan(_650);
        bool _704 = _700 || _702;
        bool _706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _708 = _704 || _706;
        if (!_708)
        {
            float _710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _712 = _650 + _710;
            float _714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _714;
            float _718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _720 = _718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _722 = 1.0 / _716;
            float _724 = _712 * _722;
            float _726 = fma(_724, _720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _698 = _726;
            _728 = true;
        }
        else
        {
            bool _730 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _732 = isnan(_650);
            bool _734 = _730 || _732;
            bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _738 = _734 || _736;
            if (!_738)
            {
                float _740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _742 = _650 + _740;
                float _744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _746 = _744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _750 = _748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _752 = 1.0 / _746;
                float _754 = _742 * _752;
                float _756 = fma(_754, _750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _698 = _756;
                _728 = true;
            }
            else
            {
                _698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _728 = false;
    float _758 = _698;
    float _760 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _762 = _610 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _766 = _616 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _770 = _618 + _768;
    float _772 = fma(_762, _758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _774 = fma(_766, _758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _776 = fma(_770, _758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _772 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _774 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = _776 + _786;
    float _790 = _780 * _780;
    float _792 = fma(_784, _784, _790);
    float _794 = fma(_788, _788, _792);
    float _796 = rsqrt(_794);
    float _798 = _796 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _800 = _784 * _798;
    float _802 = _788 * _798;
    float _804 = _800 * _800;
    float _806 = _802 * _802;
    float _808 = _804 + _806;
    float _810 = sqrt(_808);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _810 + _814;
    float _818 = _796;
    float _820 = _808;
    float _822 = _816;
    float _824 = _780;
    float _826 = _800;
    if (_812)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _818 = _828;
    }
    float _830 = _818;
    if (_812)
    {
        float _832 = rsqrt(_808);
        _820 = _832;
    }
    float _834 = _820;
    if (_812)
    {
        float _836 = _816 * _830;
        _822 = _836;
    }
    float _838 = _822;
    if (_812)
    {
        float _840 = _838 * 0.15915493667125701904296875;
        _624 = _840;
    }
    float _842 = _624;
    float _844 = _788;
    float _846 = _842;
    if (_812)
    {
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _856 = precise::max(0.0, _854);
    float _858 = _830;
    float _860 = _856;
    if (_812)
    {
        float _862 = _842 * 6.283185482025146484375;
        float _864 = cos(_862);
        _858 = _864;
    }
    float _866 = _858;
    float _868 = -_798;
    float _870 = -_856;
    float _872 = fma(_780, _868, _870);
    if (_812)
    {
        float _874 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _824 = _874;
    }
    float _876 = _824;
    float _878 = _852;
    float _880 = _876;
    if (_812)
    {
        float _882 = fma(_852, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _882;
    }
    float _884 = _878;
    float _886 = _884;
    if (!_812)
    {
        _880 = _804;
    }
    float _888 = _880;
    float _890 = _888;
    float _892 = _866;
    if (_812)
    {
        float _894 = _866 + (-1.0);
        _860 = _894;
    }
    float _896 = _860;
    float _898 = _896;
    if (_812)
    {
        float _900 = _834 * _884;
        _692 = _900;
    }
    float _902 = _692;
    if (!_812)
    {
        _886 = _872;
    }
    float _904 = _886;
    float _906 = sqrt(_794);
    float _908 = _904;
    if (_812)
    {
        float _910 = _896 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _910;
    }
    float _912 = _846;
    if (_812)
    {
        float _914 = _800 * _902;
        _826 = _914;
    }
    float _916 = _826;
    if (!_812)
    {
        _898 = _802;
    }
    float _918 = _898;
    float _920 = _918;
    if (_812)
    {
        float _922 = _802 * _902;
        _920 = _922;
    }
    float _924 = _920;
    if (_812)
    {
        float _926 = fma(_872, _866, _912);
        _908 = _926;
    }
    float _928 = _908;
    if (_812)
    {
        float _930 = _916 * _916;
        _890 = _930;
    }
    float _932 = _890;
    if (!_812)
    {
        _892 = _806;
    }
    float _934 = _892;
    float _936 = _934;
    if (_812)
    {
        float _938 = _924 * _924;
        _936 = _938;
    }
    float _940 = _936;
    float _942 = fma(_928, _928, _932);
    float _944 = _772 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _946 = _942 + _940;
    float _948 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _944);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _952 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _950);
    float _954 = precise::clamp(_952, 0.0, 1.0);
    float _956 = _772 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _960 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _962 = rsqrt(_946);
    float _964 = -_954;
    float _966 = _964 + 1.0;
    float _968 = _772 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _956);
    float _972 = _960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _772 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _976 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _978 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[1].z, _970);
    float _980 = abs(_966);
    float _982 = log2(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _986 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _974);
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[0].z, _976);
    float _990 = _978 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _992 = -_984;
    float _994 = fma(_992, _958, 1.0);
    float _996 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _998 = _988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1000 = _962 * _916;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1004 = _962 * _928;
    float _1006 = _962 * _924;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1002);
    float _1012 = _996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = log2(_994);
    float _1016 = -_1008;
    float _1018 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1016);
    float _1020 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1022 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1010);
    float _1024 = _990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1026 = -_1006;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1018);
    float _1030 = _990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1022);
    float _1034 = exp2(_1020);
    float _1036 = fma(_1028, -0.5, 0.5);
    float _1038 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1030);
    float _1040 = fma(_1028, 0.5, 0.5);
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1024);
    float _1044 = _1004 + 1.0;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1050 = 1.0 / _1032;
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1054 = _1014 * 0.693147182464599609375;
    float _1056 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = sqrt(_1036);
    float _1060 = -_1004;
    float _1062 = fma(_1034, _1044, _1060);
    float _1064 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1066 = fma(_1040, _1048, -0.212114393711090087890625);
    float _1068 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1052);
    float _1070 = fma(_1040, _1066, 1.570728778839111328125);
    float _1072 = _1064 * _1050;
    float _1074 = _1068 * _1050;
    float _1076 = fma(_1062, 0.5, 0.5);
    float _1078 = fma(_1072, 0.5, 0.5);
    float _1080 = fma(_1074, -0.5, 0.5);
    float _1082 = _1058 * 0.636619746685028076171875;
    float3 _2866 = float3(_1078, _1080, _1056);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2866, float3(0.0), isnan(_2866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2866, float3(0.0), isnan(_2866)), level(0.0)).x;
    float _1086 = -_1070;
    float _1088 = fma(_1082, _1086, 1.0);
    float3 _2882 = float3(_1078, _1080, _1056);
    float4 _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2882, float3(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2882, float3(0.0), isnan(_2882)), level(0.0)).xyzw;
    float _1093 = _1091.x;
    float _1095 = _1091.y;
    float _1097 = _1091.z;
    float _1099 = _1091.w;
    float2 _2899 = float2(_1088, _1076);
    float3 _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2899, float2(0.0), isnan(_2899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2899, float2(0.0), isnan(_2899)), level(0.0)).xyz;
    float _1105 = _1103.x;
    float _1107 = _1103.y;
    float _1109 = _1103.z;
    float _1111 = _990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1113 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1115 = _1064 + _1032;
    float _1117 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1111);
    float _1119 = _1115 * 0.5;
    float _1121 = exp2(_1113);
    float _1123 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1117);
    float _1125 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1127 = _1032 * 0.5;
    float _1129 = _1125 + _1032;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1068, -0.5, _1127);
    float _1137 = _1129 * 0.5;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1064;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1125;
    out.gl_Position.w = _1032;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1119;
    out.m_67.y = _1135;
    out.m_67.z = _1137;
    out.m_67.w = _1032;
    out.m_47.x = _1141;
    float _1143 = _1139 * _1084;
    float _1145 = -_1139;
    float _1147 = _1145 + 1.0;
    float _1149 = _1099 * _1143;
    float _1151 = _1109 * _1143;
    float _1153 = fma(_1105, _1149, _1093);
    float _1155 = fma(_1107, _1149, _1095);
    float _1157 = _1099 * _1147;
    float _1159 = fma(_1099, _1151, _1097);
    out.m_69.x = _1153;
    out.m_69.y = _1155;
    out.m_69.z = _1159;
    out.m_69.w = _1157;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _728 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1216 = as_type<float>(_104);
        out.gl_Position.z = _1216;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_140);
        out.gl_Position.z = _1284;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _266 = _258;
    float _268 = _262;
    float _286;
    if (!_264)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_88);
        float _292 = 1.0 / _290;
        float _294 = _122 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    bool _308 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_296);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = in.m_53.y;
    float _326 = 1.0 / _322;
    bool _328 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_318;
    float _342 = _340 + 1.0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _368 = _366 != 0;
    float _370 = _300 * _326;
    float _372 = in.m_55.x;
    float _374 = in.m_55.y;
    float _376 = in.m_55.z;
    float _378 = fma(_354, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = fma(_350, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_358, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = 0.0;
    if (_346)
    {
        float _386 = in.m_53.x;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = _378 * _360;
    float _392 = _380 * _360;
    float _394 = _382 * _360;
    bool _396 = _324 > 0.5;
    float _398 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _400 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _404 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].y, _398);
    float _406 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].x, _400);
    float _408 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].z, _402);
    float _410 = _404 * _304;
    float _412 = _406 * _302;
    float _414 = _408 * _306;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _420 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _372);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _376);
    float _424 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = _418 * _416;
    float _430 = _424 * _420;
    float _432 = _426 * _422;
    float _434 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _440 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _438);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _446);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _466 = in.m_57.y;
    float _468 = _458 + _462;
    float _470 = _460 + _464;
    float _472 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = in.m_57.x;
    float _476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _470 + _480;
    float _484 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _488 = _478 * _478;
    float _490 = _482 * _482;
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _484);
    float _494 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _498 = _488 + _490;
    float _500 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _492);
    float _502 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _506 = sqrt(_498);
    float _508 = -_466;
    float _510 = _508 + 1.0;
    float _512 = _502 + _504;
    float _514 = _466;
    float _516 = _388;
    float _518 = _484;
    float _520 = _510;
    float _522 = _468;
    float _524 = _432;
    if (_368)
    {
        float _526 = _396 ? _510 : _466;
        _514 = _526;
    }
    float _528 = _514;
    bool _530 = _388 > 0.5;
    bool _532 = _530 && _346;
    if (_346)
    {
        _516 = _474;
    }
    float _534 = _516;
    bool _536 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _538 = _534;
    if (!_536)
    {
        _266 = _468;
    }
    float _540 = _266;
    float _542 = _540;
    if (!_536)
    {
        _518 = _490;
    }
    float _544 = _518;
    float _546 = _544;
    if (!_536)
    {
        _520 = _488;
    }
    float _548 = _520;
    float _550 = _548;
    if (!_536)
    {
        _268 = _470;
    }
    float _552 = _268;
    float _554 = _552;
    if (!_536)
    {
        _522 = _512;
    }
    float _556 = _522;
    bool _558 = !_536;
    float _560 = _556;
    if (!_558)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _566 = _506 + _564;
        float _568 = rsqrt(_498);
        float _570 = _566 * _562;
        float _572 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * 0.15915493667125701904296875;
        float _576 = _574 * 6.283185482025146484375;
        float _578 = sin(_576);
        float _580 = _574 * 6.283185482025146484375;
        float _582 = cos(_580);
        float _584 = fma(_578, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _586 = _568 * _584;
        float _588 = _582 + (-1.0);
        float _590 = fma(_478, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _592 = fma(_482, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _594 = _588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _598 = _590 + _596;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _602 = _592 + _600;
        float _604 = fma(_512, _582, _594);
        float _606 = _598 * _598;
        float _608 = _602 * _602;
        _560 = _604;
        _550 = _606;
        _546 = _608;
        _542 = _590;
        _554 = _592;
    }
    float _610 = _560;
    float _612 = _550;
    float _614 = _546;
    float _616 = _542;
    float _618 = _554;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _622 = _610 + _620;
    float _624 = _616;
    if (_532)
    {
        float _626 = -_534;
        float _628 = _626 + 1.0;
        _538 = _628;
    }
    float _630 = _538;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_346)
    {
        _524 = _474;
    }
    float _634 = _524;
    float _636 = fma(_622, _622, _612);
    float _638 = _528 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = _634;
    if (_346)
    {
        _640 = _630;
    }
    float _642 = _640;
    float _644 = _636 + _614;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _650 = sqrt(_644);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _662 = _638 * _496;
    float _664 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _648 * _632;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _688 = _684 || _686;
    out.m_61.x = _668;
    out.m_61.y = _670;
    out.m_61.z = _672;
    out.m_61.w = _666;
    out.m_63.x = _664;
    out.m_63.y = _674;
    out.m_63.z = _676;
    out.m_65.x = _678;
    out.m_65.y = _662;
    float _690 = _648;
    float _692 = _664;
    if (!_688)
    {
        _690 = 1.0;
    }
    float _694 = _690;
    bool _696 = !_688;
    float _698 = _694;
    if (!_696)
    {
        bool _700 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _702 = isnan(_650);
        bool _704 = _700 || _702;
        bool _706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _708 = _704 || _706;
        if (!_708)
        {
            float _710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _712 = _650 + _710;
            float _714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _714;
            float _718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _720 = _718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _722 = 1.0 / _716;
            float _724 = _712 * _722;
            float _726 = fma(_724, _720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _698 = _726;
            _728 = true;
        }
        else
        {
            bool _730 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _732 = isnan(_650);
            bool _734 = _730 || _732;
            bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _738 = _734 || _736;
            if (!_738)
            {
                float _740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _742 = _650 + _740;
                float _744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _746 = _744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _750 = _748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _752 = 1.0 / _746;
                float _754 = _742 * _752;
                float _756 = fma(_754, _750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _698 = _756;
                _728 = true;
            }
            else
            {
                _698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _728 = false;
    float _758 = _698;
    float _760 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _762 = _610 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _766 = _616 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _770 = _618 + _768;
    float _772 = fma(_762, _758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _774 = fma(_766, _758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _776 = fma(_770, _758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _772 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _774 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = _776 + _786;
    float _790 = _780 * _780;
    float _792 = fma(_784, _784, _790);
    float _794 = fma(_788, _788, _792);
    float _796 = rsqrt(_794);
    float _798 = _796 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _800 = _784 * _798;
    float _802 = _788 * _798;
    float _804 = _800 * _800;
    float _806 = _802 * _802;
    float _808 = _804 + _806;
    float _810 = sqrt(_808);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _810 + _814;
    float _818 = _796;
    float _820 = _808;
    float _822 = _816;
    float _824 = _780;
    float _826 = _800;
    if (_812)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _818 = _828;
    }
    float _830 = _818;
    if (_812)
    {
        float _832 = rsqrt(_808);
        _820 = _832;
    }
    float _834 = _820;
    if (_812)
    {
        float _836 = _816 * _830;
        _822 = _836;
    }
    float _838 = _822;
    if (_812)
    {
        float _840 = _838 * 0.15915493667125701904296875;
        _624 = _840;
    }
    float _842 = _624;
    float _844 = _788;
    float _846 = _842;
    if (_812)
    {
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _856 = precise::max(0.0, _854);
    float _858 = _830;
    float _860 = _856;
    if (_812)
    {
        float _862 = _842 * 6.283185482025146484375;
        float _864 = cos(_862);
        _858 = _864;
    }
    float _866 = _858;
    float _868 = -_798;
    float _870 = -_856;
    float _872 = fma(_780, _868, _870);
    if (_812)
    {
        float _874 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _824 = _874;
    }
    float _876 = _824;
    float _878 = _852;
    float _880 = _876;
    if (_812)
    {
        float _882 = fma(_852, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _882;
    }
    float _884 = _878;
    float _886 = _884;
    if (!_812)
    {
        _880 = _804;
    }
    float _888 = _880;
    float _890 = _888;
    float _892 = _866;
    if (_812)
    {
        float _894 = _866 + (-1.0);
        _860 = _894;
    }
    float _896 = _860;
    float _898 = _896;
    if (_812)
    {
        float _900 = _834 * _884;
        _692 = _900;
    }
    float _902 = _692;
    if (!_812)
    {
        _886 = _872;
    }
    float _904 = _886;
    float _906 = sqrt(_794);
    float _908 = _904;
    if (_812)
    {
        float _910 = _896 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _910;
    }
    float _912 = _846;
    if (_812)
    {
        float _914 = _800 * _902;
        _826 = _914;
    }
    float _916 = _826;
    if (!_812)
    {
        _898 = _802;
    }
    float _918 = _898;
    float _920 = _918;
    if (_812)
    {
        float _922 = _802 * _902;
        _920 = _922;
    }
    float _924 = _920;
    if (_812)
    {
        float _926 = fma(_872, _866, _912);
        _908 = _926;
    }
    float _928 = _908;
    if (_812)
    {
        float _930 = _916 * _916;
        _890 = _930;
    }
    float _932 = _890;
    if (!_812)
    {
        _892 = _806;
    }
    float _934 = _892;
    float _936 = _934;
    if (_812)
    {
        float _938 = _924 * _924;
        _936 = _938;
    }
    float _940 = _936;
    float _942 = fma(_928, _928, _932);
    float _944 = _772 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _946 = _942 + _940;
    float _948 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _944);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _952 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _950);
    float _954 = precise::clamp(_952, 0.0, 1.0);
    float _956 = _772 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _960 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _962 = rsqrt(_946);
    float _964 = -_954;
    float _966 = _964 + 1.0;
    float _968 = _772 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _956);
    float _972 = _960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _772 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _976 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _978 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[1].z, _970);
    float _980 = abs(_966);
    float _982 = log2(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _986 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _974);
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[0].z, _976);
    float _990 = _978 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _992 = -_984;
    float _994 = fma(_992, _958, 1.0);
    float _996 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _998 = _988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1000 = _962 * _916;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1004 = _962 * _928;
    float _1006 = _962 * _924;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1002);
    float _1012 = _996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = log2(_994);
    float _1016 = -_1008;
    float _1018 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1016);
    float _1020 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1022 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1010);
    float _1024 = _990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1026 = -_1006;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1018);
    float _1030 = _990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1022);
    float _1034 = exp2(_1020);
    float _1036 = fma(_1028, -0.5, 0.5);
    float _1038 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1030);
    float _1040 = fma(_1028, 0.5, 0.5);
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1024);
    float _1044 = _1004 + 1.0;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1050 = 1.0 / _1032;
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1054 = _1014 * 0.693147182464599609375;
    float _1056 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = sqrt(_1036);
    float _1060 = -_1004;
    float _1062 = fma(_1034, _1044, _1060);
    float _1064 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1066 = fma(_1040, _1048, -0.212114393711090087890625);
    float _1068 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1052);
    float _1070 = fma(_1040, _1066, 1.570728778839111328125);
    float _1072 = _1064 * _1050;
    float _1074 = _1068 * _1050;
    float _1076 = fma(_1062, 0.5, 0.5);
    float _1078 = fma(_1072, 0.5, 0.5);
    float _1080 = fma(_1074, -0.5, 0.5);
    float _1082 = _1058 * 0.636619746685028076171875;
    float3 _2866 = float3(_1078, _1080, _1056);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2866, float3(0.0), isnan(_2866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2866, float3(0.0), isnan(_2866)), level(0.0)).x;
    float _1086 = -_1070;
    float _1088 = fma(_1082, _1086, 1.0);
    float3 _2882 = float3(_1078, _1080, _1056);
    float4 _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2882, float3(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2882, float3(0.0), isnan(_2882)), level(0.0)).xyzw;
    float _1093 = _1091.x;
    float _1095 = _1091.y;
    float _1097 = _1091.z;
    float _1099 = _1091.w;
    float2 _2899 = float2(_1088, _1076);
    float3 _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2899, float2(0.0), isnan(_2899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2899, float2(0.0), isnan(_2899)), level(0.0)).xyz;
    float _1105 = _1103.x;
    float _1107 = _1103.y;
    float _1109 = _1103.z;
    float _1111 = _990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1113 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1115 = _1064 + _1032;
    float _1117 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1111);
    float _1119 = _1115 * 0.5;
    float _1121 = exp2(_1113);
    float _1123 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1117);
    float _1125 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1127 = _1032 * 0.5;
    float _1129 = _1125 + _1032;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1068, -0.5, _1127);
    float _1137 = _1129 * 0.5;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1064;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1125;
    out.gl_Position.w = _1032;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1119;
    out.m_67.y = _1135;
    out.m_67.z = _1137;
    out.m_67.w = _1032;
    out.m_47.x = _1141;
    float _1143 = _1139 * _1084;
    float _1145 = -_1139;
    float _1147 = _1145 + 1.0;
    float _1149 = _1099 * _1143;
    float _1151 = _1109 * _1143;
    float _1153 = fma(_1105, _1149, _1093);
    float _1155 = fma(_1107, _1149, _1095);
    float _1157 = _1099 * _1147;
    float _1159 = fma(_1099, _1151, _1097);
    out.m_69.x = _1153;
    out.m_69.y = _1155;
    out.m_69.z = _1159;
    out.m_69.w = _1157;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _728 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1216 = as_type<float>(_104);
        out.gl_Position.z = _1216;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_140);
        out.gl_Position.z = _1284;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = exp2(_198);
        float _202 = _196 * 0.693147182464599609375;
        float _204 = 1.0 / _202;
        float _206 = 1.0 / _194;
        float _208 = _200 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _204, _144);
        float _214 = _212 * _206;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _266 = _258;
    float _268 = _262;
    float _286;
    if (!_264)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_88);
        float _292 = 1.0 / _290;
        float _294 = _122 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    float _302 = in.m_51.x;
    float _304 = in.m_51.y;
    float _306 = in.m_51.z;
    bool _308 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _310 = isnan(_296);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = in.m_53.y;
    float _326 = 1.0 / _322;
    bool _328 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _330 = isnan(_296);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -_318;
    float _342 = _340 + 1.0;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = _338 * _342;
    float _362 = -_338;
    float _364 = _362 + 1.0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _368 = _366 != 0;
    float _370 = _300 * _326;
    float _372 = in.m_55.x;
    float _374 = in.m_55.y;
    float _376 = in.m_55.z;
    float _378 = fma(_354, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = fma(_350, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _382 = fma(_358, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = 0.0;
    if (_346)
    {
        float _386 = in.m_53.x;
        _384 = _386;
    }
    float _388 = _384;
    float _390 = _378 * _360;
    float _392 = _380 * _360;
    float _394 = _382 * _360;
    bool _396 = _324 > 0.5;
    float _398 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _390);
    float _400 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _392);
    float _402 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _404 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].y, _398);
    float _406 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].x, _400);
    float _408 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[144].z, _402);
    float _410 = _404 * _304;
    float _412 = _406 * _302;
    float _414 = _408 * _306;
    float _416 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _374);
    float _418 = _410 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _420 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _372);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _376);
    float _424 = _412 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _426 = _414 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _428 = _418 * _416;
    float _430 = _424 * _420;
    float _432 = _426 * _422;
    float _434 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _436 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _438 = _428 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _440 = _428 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _442 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _434);
    float _444 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _436);
    float _446 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _438);
    float _448 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[26].x, _440);
    float _450 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _442);
    float _452 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _444);
    float _454 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _446);
    float _456 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _448);
    float _458 = _450 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _460 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _462 = _454 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _464 = _456 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _466 = in.m_57.y;
    float _468 = _458 + _462;
    float _470 = _460 + _464;
    float _472 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _474 = in.m_57.x;
    float _476 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _482 = _470 + _480;
    float _484 = _428 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _486 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _472);
    float _488 = _478 * _478;
    float _490 = _482 * _482;
    float _492 = fma(_430, (*spvDescriptorSet0.vp_c8)._m0[25].x, _484);
    float _494 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _486);
    float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _498 = _488 + _490;
    float _500 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _492);
    float _502 = _494 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _504 = _500 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _506 = sqrt(_498);
    float _508 = -_466;
    float _510 = _508 + 1.0;
    float _512 = _502 + _504;
    float _514 = _466;
    float _516 = _388;
    float _518 = _484;
    float _520 = _510;
    float _522 = _468;
    float _524 = _432;
    if (_368)
    {
        float _526 = _396 ? _510 : _466;
        _514 = _526;
    }
    float _528 = _514;
    bool _530 = _388 > 0.5;
    bool _532 = _530 && _346;
    if (_346)
    {
        _516 = _474;
    }
    float _534 = _516;
    bool _536 = _506 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _538 = _534;
    if (!_536)
    {
        _266 = _468;
    }
    float _540 = _266;
    float _542 = _540;
    if (!_536)
    {
        _518 = _490;
    }
    float _544 = _518;
    float _546 = _544;
    if (!_536)
    {
        _520 = _488;
    }
    float _548 = _520;
    float _550 = _548;
    if (!_536)
    {
        _268 = _470;
    }
    float _552 = _268;
    float _554 = _552;
    if (!_536)
    {
        _522 = _512;
    }
    float _556 = _522;
    bool _558 = !_536;
    float _560 = _556;
    if (!_558)
    {
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _564 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _566 = _506 + _564;
        float _568 = rsqrt(_498);
        float _570 = _566 * _562;
        float _572 = _512 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _574 = _570 * 0.15915493667125701904296875;
        float _576 = _574 * 6.283185482025146484375;
        float _578 = sin(_576);
        float _580 = _574 * 6.283185482025146484375;
        float _582 = cos(_580);
        float _584 = fma(_578, _572, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _586 = _568 * _584;
        float _588 = _582 + (-1.0);
        float _590 = fma(_478, _586, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _592 = fma(_482, _586, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _594 = _588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _598 = _590 + _596;
        float _600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _602 = _592 + _600;
        float _604 = fma(_512, _582, _594);
        float _606 = _598 * _598;
        float _608 = _602 * _602;
        _560 = _604;
        _550 = _606;
        _546 = _608;
        _542 = _590;
        _554 = _592;
    }
    float _610 = _560;
    float _612 = _550;
    float _614 = _546;
    float _616 = _542;
    float _618 = _554;
    float _620 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _622 = _610 + _620;
    float _624 = _616;
    if (_532)
    {
        float _626 = -_534;
        float _628 = _626 + 1.0;
        _538 = _628;
    }
    float _630 = _538;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_346)
    {
        _524 = _474;
    }
    float _634 = _524;
    float _636 = fma(_622, _622, _612);
    float _638 = _528 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _640 = _634;
    if (_346)
    {
        _640 = _630;
    }
    float _642 = _640;
    float _644 = _636 + _614;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _648 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _650 = sqrt(_644);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _662 = _638 * _496;
    float _664 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _670 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _672 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _648 * _632;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _688 = _684 || _686;
    out.m_61.x = _668;
    out.m_61.y = _670;
    out.m_61.z = _672;
    out.m_61.w = _666;
    out.m_63.x = _664;
    out.m_63.y = _674;
    out.m_63.z = _676;
    out.m_65.x = _678;
    out.m_65.y = _662;
    float _690 = _648;
    float _692 = _664;
    if (!_688)
    {
        _690 = 1.0;
    }
    float _694 = _690;
    bool _696 = !_688;
    float _698 = _694;
    if (!_696)
    {
        bool _700 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _702 = isnan(_650);
        bool _704 = _700 || _702;
        bool _706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _708 = _704 || _706;
        if (!_708)
        {
            float _710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _712 = _650 + _710;
            float _714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _714;
            float _718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _720 = _718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _722 = 1.0 / _716;
            float _724 = _712 * _722;
            float _726 = fma(_724, _720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _698 = _726;
            _728 = true;
        }
        else
        {
            bool _730 = _650 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _732 = isnan(_650);
            bool _734 = _730 || _732;
            bool _736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _738 = _734 || _736;
            if (!_738)
            {
                float _740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _742 = _650 + _740;
                float _744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _746 = _744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _750 = _748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _752 = 1.0 / _746;
                float _754 = _742 * _752;
                float _756 = fma(_754, _750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _698 = _756;
                _728 = true;
            }
            else
            {
                _698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _728 = false;
    float _758 = _698;
    float _760 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _762 = _610 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _766 = _616 + _764;
    float _768 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _770 = _618 + _768;
    float _772 = fma(_762, _758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _774 = fma(_766, _758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _776 = fma(_770, _758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _772 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _784 = _774 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _788 = _776 + _786;
    float _790 = _780 * _780;
    float _792 = fma(_784, _784, _790);
    float _794 = fma(_788, _788, _792);
    float _796 = rsqrt(_794);
    float _798 = _796 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _800 = _784 * _798;
    float _802 = _788 * _798;
    float _804 = _800 * _800;
    float _806 = _802 * _802;
    float _808 = _804 + _806;
    float _810 = sqrt(_808);
    bool _812 = _810 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _816 = _810 + _814;
    float _818 = _796;
    float _820 = _808;
    float _822 = _816;
    float _824 = _780;
    float _826 = _800;
    if (_812)
    {
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _818 = _828;
    }
    float _830 = _818;
    if (_812)
    {
        float _832 = rsqrt(_808);
        _820 = _832;
    }
    float _834 = _820;
    if (_812)
    {
        float _836 = _816 * _830;
        _822 = _836;
    }
    float _838 = _822;
    if (_812)
    {
        float _840 = _838 * 0.15915493667125701904296875;
        _624 = _840;
    }
    float _842 = _624;
    float _844 = _788;
    float _846 = _842;
    if (_812)
    {
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        _844 = _850;
    }
    float _852 = _844;
    float _854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _856 = precise::max(0.0, _854);
    float _858 = _830;
    float _860 = _856;
    if (_812)
    {
        float _862 = _842 * 6.283185482025146484375;
        float _864 = cos(_862);
        _858 = _864;
    }
    float _866 = _858;
    float _868 = -_798;
    float _870 = -_856;
    float _872 = fma(_780, _868, _870);
    if (_812)
    {
        float _874 = _872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _824 = _874;
    }
    float _876 = _824;
    float _878 = _852;
    float _880 = _876;
    if (_812)
    {
        float _882 = fma(_852, _876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _878 = _882;
    }
    float _884 = _878;
    float _886 = _884;
    if (!_812)
    {
        _880 = _804;
    }
    float _888 = _880;
    float _890 = _888;
    float _892 = _866;
    if (_812)
    {
        float _894 = _866 + (-1.0);
        _860 = _894;
    }
    float _896 = _860;
    float _898 = _896;
    if (_812)
    {
        float _900 = _834 * _884;
        _692 = _900;
    }
    float _902 = _692;
    if (!_812)
    {
        _886 = _872;
    }
    float _904 = _886;
    float _906 = sqrt(_794);
    float _908 = _904;
    if (_812)
    {
        float _910 = _896 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _846 = _910;
    }
    float _912 = _846;
    if (_812)
    {
        float _914 = _800 * _902;
        _826 = _914;
    }
    float _916 = _826;
    if (!_812)
    {
        _898 = _802;
    }
    float _918 = _898;
    float _920 = _918;
    if (_812)
    {
        float _922 = _802 * _902;
        _920 = _922;
    }
    float _924 = _920;
    if (_812)
    {
        float _926 = fma(_872, _866, _912);
        _908 = _926;
    }
    float _928 = _908;
    if (_812)
    {
        float _930 = _916 * _916;
        _890 = _930;
    }
    float _932 = _890;
    if (!_812)
    {
        _892 = _806;
    }
    float _934 = _892;
    float _936 = _934;
    if (_812)
    {
        float _938 = _924 * _924;
        _936 = _938;
    }
    float _940 = _936;
    float _942 = fma(_928, _928, _932);
    float _944 = _772 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _946 = _942 + _940;
    float _948 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[2].x, _944);
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _952 = fma(_906, (*spvDescriptorSet0.vp_c15)._m0[23].w, _950);
    float _954 = precise::clamp(_952, 0.0, 1.0);
    float _956 = _772 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _960 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[2].z, _948);
    float _962 = rsqrt(_946);
    float _964 = -_954;
    float _966 = _964 + 1.0;
    float _968 = _772 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[1].x, _956);
    float _972 = _960 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _974 = _772 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _976 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _978 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[1].z, _970);
    float _980 = abs(_966);
    float _982 = log2(_980);
    float _984 = _972 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _986 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[3].x, _974);
    float _988 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[0].z, _976);
    float _990 = _978 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _992 = -_984;
    float _994 = fma(_992, _958, 1.0);
    float _996 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[3].z, _986);
    float _998 = _988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1000 = _962 * _916;
    float _1002 = _990 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1004 = _962 * _928;
    float _1006 = _962 * _924;
    float _1008 = _1000 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1002);
    float _1012 = _996 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1014 = log2(_994);
    float _1016 = -_1008;
    float _1018 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1016);
    float _1020 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1022 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1010);
    float _1024 = _990 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1026 = -_1006;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1018);
    float _1030 = _990 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1032 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1022);
    float _1034 = exp2(_1020);
    float _1036 = fma(_1028, -0.5, 0.5);
    float _1038 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1030);
    float _1040 = fma(_1028, 0.5, 0.5);
    float _1042 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1024);
    float _1044 = _1004 + 1.0;
    float _1046 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1038);
    float _1048 = fma(_1040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1050 = 1.0 / _1032;
    float _1052 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1042);
    float _1054 = _1014 * 0.693147182464599609375;
    float _1056 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1058 = sqrt(_1036);
    float _1060 = -_1004;
    float _1062 = fma(_1034, _1044, _1060);
    float _1064 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1046);
    float _1066 = fma(_1040, _1048, -0.212114393711090087890625);
    float _1068 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1052);
    float _1070 = fma(_1040, _1066, 1.570728778839111328125);
    float _1072 = _1064 * _1050;
    float _1074 = _1068 * _1050;
    float _1076 = fma(_1062, 0.5, 0.5);
    float _1078 = fma(_1072, 0.5, 0.5);
    float _1080 = fma(_1074, -0.5, 0.5);
    float _1082 = _1058 * 0.636619746685028076171875;
    float3 _2866 = float3(_1078, _1080, _1056);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2866, float3(0.0), isnan(_2866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2866, float3(0.0), isnan(_2866)), level(0.0)).x;
    float _1086 = -_1070;
    float _1088 = fma(_1082, _1086, 1.0);
    float3 _2882 = float3(_1078, _1080, _1056);
    float4 _1091 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2882, float3(0.0), isnan(_2882)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2882, float3(0.0), isnan(_2882)), level(0.0)).xyzw;
    float _1093 = _1091.x;
    float _1095 = _1091.y;
    float _1097 = _1091.z;
    float _1099 = _1091.w;
    float2 _2899 = float2(_1088, _1076);
    float3 _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2899, float2(0.0), isnan(_2899)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2899, float2(0.0), isnan(_2899)), level(0.0)).xyz;
    float _1105 = _1103.x;
    float _1107 = _1103.y;
    float _1109 = _1103.z;
    float _1111 = _990 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1113 = _982 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1115 = _1064 + _1032;
    float _1117 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1111);
    float _1119 = _1115 * 0.5;
    float _1121 = exp2(_1113);
    float _1123 = fma(_972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1117);
    float _1125 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1123);
    float _1127 = _1032 * 0.5;
    float _1129 = _1125 + _1032;
    float _1131 = -_1121;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1068, -0.5, _1127);
    float _1137 = _1129 * 0.5;
    float _1139 = _1133 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1064;
    out.gl_Position.y = _1068;
    out.gl_Position.z = _1125;
    out.gl_Position.w = _1032;
    float _1141 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _1119;
    out.m_67.y = _1135;
    out.m_67.z = _1137;
    out.m_67.w = _1032;
    out.m_47.x = _1141;
    float _1143 = _1139 * _1084;
    float _1145 = -_1139;
    float _1147 = _1145 + 1.0;
    float _1149 = _1099 * _1143;
    float _1151 = _1109 * _1143;
    float _1153 = fma(_1105, _1149, _1093);
    float _1155 = fma(_1107, _1149, _1095);
    float _1157 = _1099 * _1147;
    float _1159 = fma(_1099, _1151, _1097);
    out.m_69.x = _1153;
    out.m_69.y = _1155;
    out.m_69.z = _1159;
    out.m_69.w = _1157;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

