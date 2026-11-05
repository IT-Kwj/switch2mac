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
    float4 m_59 [[user(locn0)]];
    float4 m_55 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_45 [[user(locn5)]];
    float4 m_61 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_96);
        out.gl_Position.z = _1222;
    }
    if (!_84)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_132);
        out.gl_Position.z = _1291;
    }
    if (_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_51.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -_300;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _304;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = _320 * _308;
    float _336 = -_320;
    float _338 = _336 + 1.0;
    float _340 = _288 * _322;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_326, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_330, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = _352 * _334;
    float _360 = _354 * _334;
    float _362 = _356 * _334;
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _366);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = _370 * _346;
    float _378 = _372 * _348;
    float _380 = _374 * _350;
    bool _382 = !_332;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_80);
        float _406 = 1.0 / _404;
        float _408 = _114 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _414 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _418 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _416);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _418);
    float _432 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _428);
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _438 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _440 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _442 = sqrt(_432);
    float _444 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    float _446 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].y, _412);
    float _448 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].x, _414);
    float _450 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].z, _438);
    float _452 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].w, _440);
    float _454 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].y, _446);
    float _456 = sqrt(_436);
    float _458 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].x, _448);
    float _460 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].z, _450);
    float _462 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].w, _452);
    float _464 = _454 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _468 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _426);
    float _472 = sqrt(_444);
    float _474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _424);
    float _476 = _458 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _478 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _480 = _468 * _466;
    float _482 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = _442 * _476;
    float _486 = _478 * _474;
    float _488 = _456 * _464;
    float _490 = _460 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _492 = _482 * _470;
    float _494 = _486 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _496 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _498 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _500 = _462 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _502 = _486 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _504 = _472 * _490;
    float _506 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[26].x, _496);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[24].x, _498);
    float _510 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[26].x, _494);
    float _512 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[24].x, _502);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _508);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _510);
    float _520 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _512);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].w, _514);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].w, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _528 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _530 = _522 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _532 = _520 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _536 = _486 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _538 = _530 + _526;
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[25].x, _528);
    float _542 = _534 + _532;
    float _544 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[25].x, _536);
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _554 = _542 + _552;
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _544);
    float _558 = _548 * _548;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].w, _550);
    float _562 = _556 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _564 = fma(_554, _554, _558);
    float _566 = _560 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _568 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _576 = _572 || _574;
    float _578 = sqrt(_564);
    float _580 = _566 + _562;
    bool _582 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _540;
    float _586 = _558;
    float _588 = _528;
    float _590 = _580;
    float _592 = _554;
    float _594 = _492;
    float _596 = _566;
    if (!_582)
    {
        _584 = _542;
    }
    float _598 = _584;
    float _600 = _598;
    if (!_582)
    {
        _586 = _538;
    }
    float _602 = _586;
    float _604 = _602;
    if (!_582)
    {
        _588 = _580;
    }
    float _606 = _588;
    bool _608 = !_582;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _578 + _614;
        float _618 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = _616 * _612;
        float _622 = rsqrt(_564);
        float _624 = _620 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = cos(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = sin(_630);
        float _634 = _628 + (-1.0);
        float _636 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = fma(_632, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _640 = fma(_580, _628, _636);
        float _642 = _622 * _638;
        float _644 = fma(_554, _642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _646 = fma(_548, _642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _600 = _644;
        _610 = _640;
        _604 = _646;
    }
    float _648 = _600;
    float _650 = _610;
    float _652 = _604;
    float _654 = _650;
    float _656 = _648;
    float _658 = _652;
    if (!_576)
    {
        float _660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _662 = _566 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _666 = _534 + _664;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _670 = -_534;
        float _672 = _670 + _648;
        float _674 = _662 * _662;
        float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _678 = _530 + _676;
        float _680 = -_566;
        float _682 = _680 + _650;
        float _684 = -_530;
        float _686 = _684 + _652;
        float _688 = fma(_666, _666, _674);
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _692 = fma(_678, _678, _688);
        float _694 = sqrt(_692);
        float _696 = _668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _698 = precise::min(_694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _700 = _698 * _690;
        float _702 = _696 * _700;
        float _704 = fma(_672, _702, _534);
        float _706 = fma(_682, _702, _566);
        float _708 = fma(_686, _702, _530);
        _654 = _706;
        _656 = _704;
        _658 = _708;
        _590 = _668;
    }
    float _710 = _654;
    float _712 = _656;
    float _714 = _658;
    float _716 = _590;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _710 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _712 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _714 + _726;
    float _730 = _720 * _720;
    float _732 = fma(_724, _724, _730);
    float _734 = fma(_728, _728, _732);
    float _736 = rsqrt(_734);
    float _738 = _736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _740 = _724 * _738;
    float _742 = _728 * _738;
    float _744 = _740 * _740;
    float _746 = _742 * _742;
    float _748 = _744 + _746;
    float _750 = sqrt(_748);
    bool _752 = _750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _756 = _750 + _754;
    float _758 = _732;
    float _760 = _736;
    float _762 = _756;
    float _764 = _738;
    if (_752)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _758 = _766;
    }
    float _768 = _758;
    if (_752)
    {
        float _770 = rsqrt(_748);
        _760 = _770;
    }
    float _772 = _760;
    float _774 = _772;
    if (_752)
    {
        float _776 = _756 * _768;
        _762 = _776;
    }
    float _778 = _762;
    if (_752)
    {
        float _780 = _778 * 0.15915493667125701904296875;
        _592 = _780;
    }
    float _782 = _592;
    float _784 = _728;
    if (_752)
    {
        float _786 = _782 * 6.283185482025146484375;
        float _788 = sin(_786);
        _784 = _788;
    }
    float _790 = _784;
    float _792 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _794 = precise::max(0.0, _792);
    float _796 = _716;
    float _798 = _794;
    float _800 = _792;
    if (_752)
    {
        float _802 = _782 * 6.283185482025146484375;
        float _804 = cos(_802);
        _796 = _804;
    }
    float _806 = _796;
    float _808 = -_738;
    float _810 = -_794;
    float _812 = fma(_720, _808, _810);
    if (_752)
    {
        float _814 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _814;
    }
    float _816 = _798;
    float _818 = sqrt(_734);
    float _820 = _816;
    float _822 = _790;
    if (_752)
    {
        float _824 = fma(_790, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _764 = _824;
    }
    float _826 = _764;
    float _828 = _826;
    if (!_752)
    {
        _820 = _740;
    }
    float _830 = _820;
    float _832 = _830;
    if (!_752)
    {
        _822 = _742;
    }
    float _834 = _822;
    float _836 = _834;
    if (_752)
    {
        float _838 = _806 + (-1.0);
        _800 = _838;
    }
    float _840 = _800;
    float _842 = _840;
    if (_752)
    {
        float _844 = _772 * _826;
        _594 = _844;
    }
    float _846 = _594;
    if (!_752)
    {
        _774 = _812;
    }
    float _848 = _774;
    float _850 = _848;
    if (_752)
    {
        float _852 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _852;
    }
    float _854 = _596;
    if (_752)
    {
        float _856 = _740 * _846;
        _832 = _856;
    }
    float _858 = _832;
    if (!_752)
    {
        _828 = _744;
    }
    float _860 = _828;
    float _862 = _860;
    if (_752)
    {
        float _864 = _742 * _846;
        _836 = _864;
    }
    float _866 = _836;
    if (_752)
    {
        float _868 = fma(_812, _806, _854);
        _850 = _868;
    }
    float _870 = _850;
    if (_752)
    {
        float _872 = _858 * _858;
        _862 = _872;
    }
    float _874 = _862;
    if (!_752)
    {
        _842 = _746;
    }
    float _876 = _842;
    float _878 = _876;
    if (_752)
    {
        float _880 = _866 * _866;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = fma(_870, _870, _874);
    float _886 = _884 + _882;
    float _888 = _710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _890);
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _898 = rsqrt(_886);
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _888);
    float _902 = _710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _904 = -_894;
    float _906 = _904 + 1.0;
    float _908 = _710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _910 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _900);
    float _912 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _902);
    float _914 = _710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _908);
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _920 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _922 = abs(_906);
    float _924 = log2(_922);
    float _926 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _928 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _916);
    float _930 = _920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _932 = _918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _934 = _898 * _858;
    float _936 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _926);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = _898 * _870;
    float _944 = _934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = -_932;
    float _948 = fma(_946, _896, 1.0);
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _954 = _898 * _866;
    float _956 = -_944;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[21].y, _956);
    float _960 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _964 = log2(_948);
    float _966 = -_954;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _958);
    float _970 = _930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].w, _962);
    float _974 = _930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _976 = fma(_968, -0.5, 0.5);
    float _978 = fma(_968, 0.5, 0.5);
    float _980 = exp2(_960);
    float _982 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _974);
    float _984 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _986 = fma(_978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _982);
    float _990 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _992 = fma(_978, _986, -0.212114393711090087890625);
    float _994 = 1.0 / _972;
    float _996 = _942 + 1.0;
    float _998 = _964 * 0.693147182464599609375;
    float _1000 = fma(_978, _992, 1.570728778839111328125);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1004 = sqrt(_976);
    float _1006 = -_942;
    float _1008 = fma(_980, _996, _1006);
    float _1010 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].w, _988);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].w, _990);
    float _1014 = _1010 * _994;
    float _1016 = _1012 * _994;
    float _1018 = fma(_1008, 0.5, 0.5);
    float _1020 = fma(_1014, 0.5, 0.5);
    float _1022 = fma(_1016, -0.5, 0.5);
    float _1024 = _1004 * 0.636619746685028076171875;
    float3 _2788 = float3(_1020, _1022, _1002);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2788, float3(0.0), isnan(_2788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2788, float3(0.0), isnan(_2788)), level(0.0)).x;
    float _1028 = -_1000;
    float _1030 = fma(_1024, _1028, 1.0);
    float3 _2804 = float3(_1020, _1022, _1002);
    float4 _1033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2804, float3(0.0), isnan(_2804)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2804, float3(0.0), isnan(_2804)), level(0.0)).xyzw;
    float _1035 = _1033.x;
    float _1037 = _1033.y;
    float _1039 = _1033.z;
    float _1041 = _1033.w;
    float2 _2821 = float2(_1030, _1018);
    float3 _1045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2821, float2(0.0), isnan(_2821)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2821, float2(0.0), isnan(_2821)), level(0.0)).xyz;
    float _1047 = _1045.x;
    float _1049 = _1045.y;
    float _1051 = _1045.z;
    float _1053 = _930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1055 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1057 = isnan(_410);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1071 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1073 = isnan(_410);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1083;
    float _1087 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1089 = 1.0 / _1069;
    float _1091 = -_1065;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1053);
    float _1097 = _1081 * _1093;
    float _1099 = -_1081;
    float _1101 = _1099 + 1.0;
    float _1103 = exp2(_1087);
    float _1105 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1095);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1109 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1105);
    float _1111 = _1085 * _1089;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _410 + _1113;
    float _1117 = _1109 + _972;
    float _1119 = fma(_1111, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1117 * 0.5;
    float _1123 = -_1103;
    float _1125 = _1123 + 1.0;
    float _1127 = _1119 * _1097;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _1129 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    out.m_57.z = _1121;
    out.m_57.w = _972;
    float _1133 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1131);
    float _1135 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1141 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1109;
    out.gl_Position.w = _972;
    float _1151 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _1141;
    out.m_59.y = _1143;
    out.m_59.z = _1145;
    out.m_59.w = _1135;
    out.m_45.x = _1151;
    float _1153 = _1129 * _1026;
    float _1155 = _1041 * _1153;
    float _1157 = _1041 * _1149;
    float _1159 = _1051 * _1153;
    float _1161 = fma(_1047, _1155, _1035);
    float _1163 = fma(_1049, _1155, _1037);
    float _1165 = fma(_1041, _1159, _1039);
    out.m_61.x = _1161;
    out.m_61.y = _1163;
    out.m_61.z = _1165;
    out.m_61.w = _1157;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_96);
        out.gl_Position.z = _1222;
    }
    if (!_84)
    {
        return out;
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_132);
        out.gl_Position.z = _1291;
    }
    if (_124)
    {
        return out;
    }
    float _134 = in.m_49.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_51.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -_300;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _304;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = _320 * _308;
    float _336 = -_320;
    float _338 = _336 + 1.0;
    float _340 = _288 * _322;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_326, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_330, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = _352 * _334;
    float _360 = _354 * _334;
    float _362 = _356 * _334;
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _366);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = _370 * _346;
    float _378 = _372 * _348;
    float _380 = _374 * _350;
    bool _382 = !_332;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_80);
        float _406 = 1.0 / _404;
        float _408 = _114 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _414 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _418 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _416);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _418);
    float _432 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _428);
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _438 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _440 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _442 = sqrt(_432);
    float _444 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    float _446 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].y, _412);
    float _448 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].x, _414);
    float _450 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].z, _438);
    float _452 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].w, _440);
    float _454 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].y, _446);
    float _456 = sqrt(_436);
    float _458 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].x, _448);
    float _460 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].z, _450);
    float _462 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].w, _452);
    float _464 = _454 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _468 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _426);
    float _472 = sqrt(_444);
    float _474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _424);
    float _476 = _458 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _478 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _480 = _468 * _466;
    float _482 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = _442 * _476;
    float _486 = _478 * _474;
    float _488 = _456 * _464;
    float _490 = _460 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _492 = _482 * _470;
    float _494 = _486 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _496 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _498 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _500 = _462 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _502 = _486 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _504 = _472 * _490;
    float _506 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[26].x, _496);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[24].x, _498);
    float _510 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[26].x, _494);
    float _512 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[24].x, _502);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _508);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _510);
    float _520 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _512);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].w, _514);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].w, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _528 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _530 = _522 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _532 = _520 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _536 = _486 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _538 = _530 + _526;
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[25].x, _528);
    float _542 = _534 + _532;
    float _544 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[25].x, _536);
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _554 = _542 + _552;
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _544);
    float _558 = _548 * _548;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].w, _550);
    float _562 = _556 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _564 = fma(_554, _554, _558);
    float _566 = _560 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _568 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _576 = _572 || _574;
    float _578 = sqrt(_564);
    float _580 = _566 + _562;
    bool _582 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _540;
    float _586 = _558;
    float _588 = _528;
    float _590 = _580;
    float _592 = _554;
    float _594 = _492;
    float _596 = _566;
    if (!_582)
    {
        _584 = _542;
    }
    float _598 = _584;
    float _600 = _598;
    if (!_582)
    {
        _586 = _538;
    }
    float _602 = _586;
    float _604 = _602;
    if (!_582)
    {
        _588 = _580;
    }
    float _606 = _588;
    bool _608 = !_582;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _578 + _614;
        float _618 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = _616 * _612;
        float _622 = rsqrt(_564);
        float _624 = _620 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = cos(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = sin(_630);
        float _634 = _628 + (-1.0);
        float _636 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = fma(_632, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _640 = fma(_580, _628, _636);
        float _642 = _622 * _638;
        float _644 = fma(_554, _642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _646 = fma(_548, _642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _600 = _644;
        _610 = _640;
        _604 = _646;
    }
    float _648 = _600;
    float _650 = _610;
    float _652 = _604;
    float _654 = _650;
    float _656 = _648;
    float _658 = _652;
    if (!_576)
    {
        float _660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _662 = _566 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _666 = _534 + _664;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _670 = -_534;
        float _672 = _670 + _648;
        float _674 = _662 * _662;
        float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _678 = _530 + _676;
        float _680 = -_566;
        float _682 = _680 + _650;
        float _684 = -_530;
        float _686 = _684 + _652;
        float _688 = fma(_666, _666, _674);
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _692 = fma(_678, _678, _688);
        float _694 = sqrt(_692);
        float _696 = _668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _698 = precise::min(_694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _700 = _698 * _690;
        float _702 = _696 * _700;
        float _704 = fma(_672, _702, _534);
        float _706 = fma(_682, _702, _566);
        float _708 = fma(_686, _702, _530);
        _654 = _706;
        _656 = _704;
        _658 = _708;
        _590 = _668;
    }
    float _710 = _654;
    float _712 = _656;
    float _714 = _658;
    float _716 = _590;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _710 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _712 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _714 + _726;
    float _730 = _720 * _720;
    float _732 = fma(_724, _724, _730);
    float _734 = fma(_728, _728, _732);
    float _736 = rsqrt(_734);
    float _738 = _736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _740 = _724 * _738;
    float _742 = _728 * _738;
    float _744 = _740 * _740;
    float _746 = _742 * _742;
    float _748 = _744 + _746;
    float _750 = sqrt(_748);
    bool _752 = _750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _756 = _750 + _754;
    float _758 = _732;
    float _760 = _736;
    float _762 = _756;
    float _764 = _738;
    if (_752)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _758 = _766;
    }
    float _768 = _758;
    if (_752)
    {
        float _770 = rsqrt(_748);
        _760 = _770;
    }
    float _772 = _760;
    float _774 = _772;
    if (_752)
    {
        float _776 = _756 * _768;
        _762 = _776;
    }
    float _778 = _762;
    if (_752)
    {
        float _780 = _778 * 0.15915493667125701904296875;
        _592 = _780;
    }
    float _782 = _592;
    float _784 = _728;
    if (_752)
    {
        float _786 = _782 * 6.283185482025146484375;
        float _788 = sin(_786);
        _784 = _788;
    }
    float _790 = _784;
    float _792 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _794 = precise::max(0.0, _792);
    float _796 = _716;
    float _798 = _794;
    float _800 = _792;
    if (_752)
    {
        float _802 = _782 * 6.283185482025146484375;
        float _804 = cos(_802);
        _796 = _804;
    }
    float _806 = _796;
    float _808 = -_738;
    float _810 = -_794;
    float _812 = fma(_720, _808, _810);
    if (_752)
    {
        float _814 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _814;
    }
    float _816 = _798;
    float _818 = sqrt(_734);
    float _820 = _816;
    float _822 = _790;
    if (_752)
    {
        float _824 = fma(_790, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _764 = _824;
    }
    float _826 = _764;
    float _828 = _826;
    if (!_752)
    {
        _820 = _740;
    }
    float _830 = _820;
    float _832 = _830;
    if (!_752)
    {
        _822 = _742;
    }
    float _834 = _822;
    float _836 = _834;
    if (_752)
    {
        float _838 = _806 + (-1.0);
        _800 = _838;
    }
    float _840 = _800;
    float _842 = _840;
    if (_752)
    {
        float _844 = _772 * _826;
        _594 = _844;
    }
    float _846 = _594;
    if (!_752)
    {
        _774 = _812;
    }
    float _848 = _774;
    float _850 = _848;
    if (_752)
    {
        float _852 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _852;
    }
    float _854 = _596;
    if (_752)
    {
        float _856 = _740 * _846;
        _832 = _856;
    }
    float _858 = _832;
    if (!_752)
    {
        _828 = _744;
    }
    float _860 = _828;
    float _862 = _860;
    if (_752)
    {
        float _864 = _742 * _846;
        _836 = _864;
    }
    float _866 = _836;
    if (_752)
    {
        float _868 = fma(_812, _806, _854);
        _850 = _868;
    }
    float _870 = _850;
    if (_752)
    {
        float _872 = _858 * _858;
        _862 = _872;
    }
    float _874 = _862;
    if (!_752)
    {
        _842 = _746;
    }
    float _876 = _842;
    float _878 = _876;
    if (_752)
    {
        float _880 = _866 * _866;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = fma(_870, _870, _874);
    float _886 = _884 + _882;
    float _888 = _710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _890);
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _898 = rsqrt(_886);
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _888);
    float _902 = _710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _904 = -_894;
    float _906 = _904 + 1.0;
    float _908 = _710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _910 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _900);
    float _912 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _902);
    float _914 = _710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _908);
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _920 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _922 = abs(_906);
    float _924 = log2(_922);
    float _926 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _928 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _916);
    float _930 = _920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _932 = _918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _934 = _898 * _858;
    float _936 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _926);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = _898 * _870;
    float _944 = _934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = -_932;
    float _948 = fma(_946, _896, 1.0);
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _954 = _898 * _866;
    float _956 = -_944;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[21].y, _956);
    float _960 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _964 = log2(_948);
    float _966 = -_954;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _958);
    float _970 = _930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].w, _962);
    float _974 = _930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _976 = fma(_968, -0.5, 0.5);
    float _978 = fma(_968, 0.5, 0.5);
    float _980 = exp2(_960);
    float _982 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _974);
    float _984 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _986 = fma(_978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _982);
    float _990 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _992 = fma(_978, _986, -0.212114393711090087890625);
    float _994 = 1.0 / _972;
    float _996 = _942 + 1.0;
    float _998 = _964 * 0.693147182464599609375;
    float _1000 = fma(_978, _992, 1.570728778839111328125);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1004 = sqrt(_976);
    float _1006 = -_942;
    float _1008 = fma(_980, _996, _1006);
    float _1010 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].w, _988);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].w, _990);
    float _1014 = _1010 * _994;
    float _1016 = _1012 * _994;
    float _1018 = fma(_1008, 0.5, 0.5);
    float _1020 = fma(_1014, 0.5, 0.5);
    float _1022 = fma(_1016, -0.5, 0.5);
    float _1024 = _1004 * 0.636619746685028076171875;
    float3 _2788 = float3(_1020, _1022, _1002);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2788, float3(0.0), isnan(_2788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2788, float3(0.0), isnan(_2788)), level(0.0)).x;
    float _1028 = -_1000;
    float _1030 = fma(_1024, _1028, 1.0);
    float3 _2804 = float3(_1020, _1022, _1002);
    float4 _1033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2804, float3(0.0), isnan(_2804)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2804, float3(0.0), isnan(_2804)), level(0.0)).xyzw;
    float _1035 = _1033.x;
    float _1037 = _1033.y;
    float _1039 = _1033.z;
    float _1041 = _1033.w;
    float2 _2821 = float2(_1030, _1018);
    float3 _1045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2821, float2(0.0), isnan(_2821)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2821, float2(0.0), isnan(_2821)), level(0.0)).xyz;
    float _1047 = _1045.x;
    float _1049 = _1045.y;
    float _1051 = _1045.z;
    float _1053 = _930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1055 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1057 = isnan(_410);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1071 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1073 = isnan(_410);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1083;
    float _1087 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1089 = 1.0 / _1069;
    float _1091 = -_1065;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1053);
    float _1097 = _1081 * _1093;
    float _1099 = -_1081;
    float _1101 = _1099 + 1.0;
    float _1103 = exp2(_1087);
    float _1105 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1095);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1109 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1105);
    float _1111 = _1085 * _1089;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _410 + _1113;
    float _1117 = _1109 + _972;
    float _1119 = fma(_1111, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1117 * 0.5;
    float _1123 = -_1103;
    float _1125 = _1123 + 1.0;
    float _1127 = _1119 * _1097;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _1129 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    out.m_57.z = _1121;
    out.m_57.w = _972;
    float _1133 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1131);
    float _1135 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1141 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1109;
    out.gl_Position.w = _972;
    float _1151 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _1141;
    out.m_59.y = _1143;
    out.m_59.z = _1145;
    out.m_59.w = _1135;
    out.m_45.x = _1151;
    float _1153 = _1129 * _1026;
    float _1155 = _1041 * _1153;
    float _1157 = _1041 * _1149;
    float _1159 = _1051 * _1153;
    float _1161 = fma(_1047, _1155, _1035);
    float _1163 = fma(_1049, _1155, _1037);
    float _1165 = fma(_1041, _1159, _1039);
    out.m_61.x = _1161;
    out.m_61.y = _1163;
    out.m_61.z = _1165;
    out.m_61.w = _1157;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    bool _402 = false;
    bool _276 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _75 = in.m_42.w;
    float _77 = trunc(_75);
    int _80 = int(_77);
    bool _84 = _80 >= 1;
    float _86 = 0.0;
    if (!_84)
    {
        _86 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _88 = _86;
    float _90 = _88;
    if (!_84)
    {
        out.m_45.x = 0.0;
    }
    int _92 = 0;
    if (!_84)
    {
        float _94 = _88 * 5.0;
        _92 = as_type<int>(_94);
    }
    int _96 = _92;
    int _98 = _96;
    if (!_84)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1222 = as_type<float>(_96);
        out.gl_Position.z = _1222;
    }
    if (!_84)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _100 = in.m_47.w;
    bool _102 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _110 = _106 || _108;
    float _112 = -_100;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_110)
    {
        float _116 = float(_80);
        _90 = _116;
    }
    float _118 = _90;
    bool _120 = _114 >= _118;
    bool _122 = !_110;
    bool _124 = _120 || _122;
    float _126 = _118;
    if (_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    if (_124)
    {
        out.m_45.x = 0.0;
    }
    if (_124)
    {
        float _130 = _128 * 5.0;
        _98 = as_type<int>(_130);
    }
    int _132 = _98;
    if (_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1291 = as_type<float>(_132);
        out.gl_Position.z = _1291;
    }
    if (_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.w;
    float _136 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _138 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _140 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _142 = _138 || _140;
    bool _144 = isnan(1.0);
    bool _146 = _142 || _144;
    float _148 = in.m_47.x;
    float _150 = in.m_47.y;
    float _152 = in.m_47.z;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = 0.0;
    float _162 = _136;
    if (!_146)
    {
        float _164 = _136 * _136;
        float _166 = _164 * 0.5;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = _168;
    if (!_146)
    {
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _170 = _172;
    }
    float _174 = _170;
    bool _176 = !_146;
    float _178 = _174;
    if (!_176)
    {
        float _180 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _182 = log2(_180);
        float _184 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _186 = _184 + 1.0;
        float _188 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = _136 * _182;
        float _192 = 1.0 / _186;
        float _194 = _188 * 0.693147182464599609375;
        float _196 = exp2(_190);
        float _198 = 1.0 / _194;
        float _200 = _196 + (-1.0);
        float _202 = -_200;
        float _204 = fma(_202, _198, _136);
        float _206 = _204 * _192;
        float _208 = _206 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _208;
    }
    float _210 = _178;
    bool _212 = !_146;
    if (!_212)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = 1.0 / _220;
        float _224 = _136 * _216;
        float _226 = exp2(_224);
        float _228 = -_226;
        float _230 = _228 + 1.0;
        float _232 = _230 * _222;
        _162 = _232;
    }
    float _234 = _162;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _238 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _240 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _242 = _210 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _244 = fma(_234, _148, _238);
    float _246 = fma(_234, _150, _240);
    float _248 = fma(_234, _152, _242);
    float _250 = fma(_244, _134, _154);
    float _252 = fma(_246, _134, _156);
    float _254 = fma(_248, _134, _158);
    bool _256 = !_236;
    float _274;
    if (!_256)
    {
        float _258 = in.m_51.x;
        float _260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _262 = _258 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _264 = fma(_262, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _266 = _264 * _260;
        float _268 = floor(_266);
        float _270 = -_268;
        float _272 = _266 + _270;
        _274 = _272;
        _276 = true;
    }
    else
    {
        float _278 = float(_80);
        float _280 = 1.0 / _278;
        float _282 = _114 * _280;
        _274 = _282;
    }
    _276 = false;
    float _284 = _274;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _288 = _284 + _286;
    bool _290 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _302;
    float _306 = -_300;
    float _308 = _306 + 1.0;
    bool _310 = _284 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _312 = isnan(_284);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _304;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _328;
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _334 = _320 * _308;
    float _336 = -_320;
    float _338 = _336 + 1.0;
    float _340 = _288 * _322;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = in.m_49.x;
    float _348 = in.m_49.y;
    float _350 = in.m_49.z;
    float _352 = fma(_326, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_330, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _358 = _352 * _334;
    float _360 = _354 * _334;
    float _362 = _356 * _334;
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _358);
    float _366 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _360);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _362);
    float _370 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].x, _364);
    float _372 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].y, _366);
    float _374 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[144].z, _368);
    float _376 = _370 * _346;
    float _378 = _372 * _348;
    float _380 = _374 * _350;
    bool _382 = !_332;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_80);
        float _406 = 1.0 / _404;
        float _408 = _114 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _414 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _416 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _418 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _420 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _416);
    float _422 = in.m_53.x;
    float _424 = in.m_53.y;
    float _426 = in.m_53.z;
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _430 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _418);
    float _432 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _420);
    float _434 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _428);
    float _436 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _430);
    float _438 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _440 = _252 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _442 = sqrt(_432);
    float _444 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _434);
    float _446 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].y, _412);
    float _448 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].x, _414);
    float _450 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].z, _438);
    float _452 = fma(_250, (*spvDescriptorSet0.vp_c10)._m0[14].w, _440);
    float _454 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].y, _446);
    float _456 = sqrt(_436);
    float _458 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].x, _448);
    float _460 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].z, _450);
    float _462 = fma(_254, (*spvDescriptorSet0.vp_c10)._m0[16].w, _452);
    float _464 = _454 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _468 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _426);
    float _472 = sqrt(_444);
    float _474 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _424);
    float _476 = _458 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _478 = _378 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _480 = _468 * _466;
    float _482 = _380 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _484 = _442 * _476;
    float _486 = _478 * _474;
    float _488 = _456 * _464;
    float _490 = _460 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _492 = _482 * _470;
    float _494 = _486 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _496 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _498 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _500 = _462 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _502 = _486 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _504 = _472 * _490;
    float _506 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[26].x, _496);
    float _508 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[24].x, _498);
    float _510 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[26].x, _494);
    float _512 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[24].x, _502);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _506);
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _508);
    float _518 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[26].z, _510);
    float _520 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[24].z, _512);
    float _522 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[26].w, _514);
    float _524 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[24].w, _516);
    float _526 = _518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _528 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _530 = _522 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _532 = _520 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _534 = _524 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _536 = _486 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _538 = _530 + _526;
    float _540 = fma(_484, (*spvDescriptorSet0.vp_c8)._m0[25].x, _528);
    float _542 = _534 + _532;
    float _544 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[25].x, _536);
    float _546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _548 = _538 + _546;
    float _550 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _554 = _542 + _552;
    float _556 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[25].z, _544);
    float _558 = _548 * _548;
    float _560 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[25].w, _550);
    float _562 = _556 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _564 = fma(_554, _554, _558);
    float _566 = _560 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    bool _568 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _576 = _572 || _574;
    float _578 = sqrt(_564);
    float _580 = _566 + _562;
    bool _582 = _578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _540;
    float _586 = _558;
    float _588 = _528;
    float _590 = _580;
    float _592 = _554;
    float _594 = _492;
    float _596 = _566;
    if (!_582)
    {
        _584 = _542;
    }
    float _598 = _584;
    float _600 = _598;
    if (!_582)
    {
        _586 = _538;
    }
    float _602 = _586;
    float _604 = _602;
    if (!_582)
    {
        _588 = _580;
    }
    float _606 = _588;
    bool _608 = !_582;
    float _610 = _606;
    if (!_608)
    {
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _616 = _578 + _614;
        float _618 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _620 = _616 * _612;
        float _622 = rsqrt(_564);
        float _624 = _620 * 0.15915493667125701904296875;
        float _626 = _624 * 6.283185482025146484375;
        float _628 = cos(_626);
        float _630 = _624 * 6.283185482025146484375;
        float _632 = sin(_630);
        float _634 = _628 + (-1.0);
        float _636 = _634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = fma(_632, _618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _640 = fma(_580, _628, _636);
        float _642 = _622 * _638;
        float _644 = fma(_554, _642, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _646 = fma(_548, _642, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _600 = _644;
        _610 = _640;
        _604 = _646;
    }
    float _648 = _600;
    float _650 = _610;
    float _652 = _604;
    float _654 = _650;
    float _656 = _648;
    float _658 = _652;
    if (!_576)
    {
        float _660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _662 = _566 + _660;
        float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _666 = _534 + _664;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _670 = -_534;
        float _672 = _670 + _648;
        float _674 = _662 * _662;
        float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _678 = _530 + _676;
        float _680 = -_566;
        float _682 = _680 + _650;
        float _684 = -_530;
        float _686 = _684 + _652;
        float _688 = fma(_666, _666, _674);
        float _690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _692 = fma(_678, _678, _688);
        float _694 = sqrt(_692);
        float _696 = _668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _698 = precise::min(_694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _700 = _698 * _690;
        float _702 = _696 * _700;
        float _704 = fma(_672, _702, _534);
        float _706 = fma(_682, _702, _566);
        float _708 = fma(_686, _702, _530);
        _654 = _706;
        _656 = _704;
        _658 = _708;
        _590 = _668;
    }
    float _710 = _654;
    float _712 = _656;
    float _714 = _658;
    float _716 = _590;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _720 = _710 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _712 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _728 = _714 + _726;
    float _730 = _720 * _720;
    float _732 = fma(_724, _724, _730);
    float _734 = fma(_728, _728, _732);
    float _736 = rsqrt(_734);
    float _738 = _736 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _740 = _724 * _738;
    float _742 = _728 * _738;
    float _744 = _740 * _740;
    float _746 = _742 * _742;
    float _748 = _744 + _746;
    float _750 = sqrt(_748);
    bool _752 = _750 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _754 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _756 = _750 + _754;
    float _758 = _732;
    float _760 = _736;
    float _762 = _756;
    float _764 = _738;
    if (_752)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _758 = _766;
    }
    float _768 = _758;
    if (_752)
    {
        float _770 = rsqrt(_748);
        _760 = _770;
    }
    float _772 = _760;
    float _774 = _772;
    if (_752)
    {
        float _776 = _756 * _768;
        _762 = _776;
    }
    float _778 = _762;
    if (_752)
    {
        float _780 = _778 * 0.15915493667125701904296875;
        _592 = _780;
    }
    float _782 = _592;
    float _784 = _728;
    if (_752)
    {
        float _786 = _782 * 6.283185482025146484375;
        float _788 = sin(_786);
        _784 = _788;
    }
    float _790 = _784;
    float _792 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _794 = precise::max(0.0, _792);
    float _796 = _716;
    float _798 = _794;
    float _800 = _792;
    if (_752)
    {
        float _802 = _782 * 6.283185482025146484375;
        float _804 = cos(_802);
        _796 = _804;
    }
    float _806 = _796;
    float _808 = -_738;
    float _810 = -_794;
    float _812 = fma(_720, _808, _810);
    if (_752)
    {
        float _814 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _798 = _814;
    }
    float _816 = _798;
    float _818 = sqrt(_734);
    float _820 = _816;
    float _822 = _790;
    if (_752)
    {
        float _824 = fma(_790, _816, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _764 = _824;
    }
    float _826 = _764;
    float _828 = _826;
    if (!_752)
    {
        _820 = _740;
    }
    float _830 = _820;
    float _832 = _830;
    if (!_752)
    {
        _822 = _742;
    }
    float _834 = _822;
    float _836 = _834;
    if (_752)
    {
        float _838 = _806 + (-1.0);
        _800 = _838;
    }
    float _840 = _800;
    float _842 = _840;
    if (_752)
    {
        float _844 = _772 * _826;
        _594 = _844;
    }
    float _846 = _594;
    if (!_752)
    {
        _774 = _812;
    }
    float _848 = _774;
    float _850 = _848;
    if (_752)
    {
        float _852 = _840 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _596 = _852;
    }
    float _854 = _596;
    if (_752)
    {
        float _856 = _740 * _846;
        _832 = _856;
    }
    float _858 = _832;
    if (!_752)
    {
        _828 = _744;
    }
    float _860 = _828;
    float _862 = _860;
    if (_752)
    {
        float _864 = _742 * _846;
        _836 = _864;
    }
    float _866 = _836;
    if (_752)
    {
        float _868 = fma(_812, _806, _854);
        _850 = _868;
    }
    float _870 = _850;
    if (_752)
    {
        float _872 = _858 * _858;
        _862 = _872;
    }
    float _874 = _862;
    if (!_752)
    {
        _842 = _746;
    }
    float _876 = _842;
    float _878 = _876;
    if (_752)
    {
        float _880 = _866 * _866;
        _878 = _880;
    }
    float _882 = _878;
    float _884 = fma(_870, _870, _874);
    float _886 = _884 + _882;
    float _888 = _710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _892 = fma(_818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _890);
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _898 = rsqrt(_886);
    float _900 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _888);
    float _902 = _710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _904 = -_894;
    float _906 = _904 + 1.0;
    float _908 = _710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _910 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _900);
    float _912 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _902);
    float _914 = _710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _916 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _908);
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _920 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _912);
    float _922 = abs(_906);
    float _924 = log2(_922);
    float _926 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _914);
    float _928 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _916);
    float _930 = _920 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _932 = _918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _934 = _898 * _858;
    float _936 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _926);
    float _938 = _928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _940 = _930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _942 = _898 * _870;
    float _944 = _934 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _946 = -_932;
    float _948 = fma(_946, _896, 1.0);
    float _950 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[7].x, _940);
    float _952 = _936 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _954 = _898 * _866;
    float _956 = -_944;
    float _958 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[21].y, _956);
    float _960 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _950);
    float _964 = log2(_948);
    float _966 = -_954;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c15)._m0[21].z, _958);
    float _970 = _930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _972 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[7].w, _962);
    float _974 = _930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _976 = fma(_968, -0.5, 0.5);
    float _978 = fma(_968, 0.5, 0.5);
    float _980 = exp2(_960);
    float _982 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[4].x, _974);
    float _984 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[5].x, _970);
    float _986 = fma(_978, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _988 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _982);
    float _990 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _984);
    float _992 = fma(_978, _986, -0.212114393711090087890625);
    float _994 = 1.0 / _972;
    float _996 = _942 + 1.0;
    float _998 = _964 * 0.693147182464599609375;
    float _1000 = fma(_978, _992, 1.570728778839111328125);
    float _1002 = _998 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1004 = sqrt(_976);
    float _1006 = -_942;
    float _1008 = fma(_980, _996, _1006);
    float _1010 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[4].w, _988);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[5].w, _990);
    float _1014 = _1010 * _994;
    float _1016 = _1012 * _994;
    float _1018 = fma(_1008, 0.5, 0.5);
    float _1020 = fma(_1014, 0.5, 0.5);
    float _1022 = fma(_1016, -0.5, 0.5);
    float _1024 = _1004 * 0.636619746685028076171875;
    float3 _2788 = float3(_1020, _1022, _1002);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2788, float3(0.0), isnan(_2788)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2788, float3(0.0), isnan(_2788)), level(0.0)).x;
    float _1028 = -_1000;
    float _1030 = fma(_1024, _1028, 1.0);
    float3 _2804 = float3(_1020, _1022, _1002);
    float4 _1033 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2804, float3(0.0), isnan(_2804)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2804, float3(0.0), isnan(_2804)), level(0.0)).xyzw;
    float _1035 = _1033.x;
    float _1037 = _1033.y;
    float _1039 = _1033.z;
    float _1041 = _1033.w;
    float2 _2821 = float2(_1030, _1018);
    float3 _1045 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2821, float2(0.0), isnan(_2821)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2821, float2(0.0), isnan(_2821)), level(0.0)).xyz;
    float _1047 = _1045.x;
    float _1049 = _1045.y;
    float _1051 = _1045.z;
    float _1053 = _930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1055 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1057 = isnan(_410);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1071 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1073 = isnan(_410);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1083;
    float _1087 = _924 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1089 = 1.0 / _1069;
    float _1091 = -_1065;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1053);
    float _1097 = _1081 * _1093;
    float _1099 = -_1081;
    float _1101 = _1099 + 1.0;
    float _1103 = exp2(_1087);
    float _1105 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1095);
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1109 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1105);
    float _1111 = _1085 * _1089;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1115 = _410 + _1113;
    float _1117 = _1109 + _972;
    float _1119 = fma(_1111, _1115, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1117 * 0.5;
    float _1123 = -_1103;
    float _1125 = _1123 + 1.0;
    float _1127 = _1119 * _1097;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    float _1129 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1131 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1127);
    out.m_57.z = _1121;
    out.m_57.w = _972;
    float _1133 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1131);
    float _1135 = _1133 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1141 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1137 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = -_1129;
    float _1149 = _1147 + 1.0;
    out.gl_Position.x = _1010;
    out.gl_Position.y = _1012;
    out.gl_Position.z = _1109;
    out.gl_Position.w = _972;
    float _1151 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_59.x = _1141;
    out.m_59.y = _1143;
    out.m_59.z = _1145;
    out.m_59.w = _1135;
    out.m_45.x = _1151;
    float _1153 = _1129 * _1026;
    float _1155 = _1041 * _1153;
    float _1157 = _1041 * _1149;
    float _1159 = _1051 * _1153;
    float _1161 = fma(_1047, _1155, _1035);
    float _1163 = fma(_1049, _1155, _1037);
    float _1165 = fma(_1041, _1159, _1039);
    out.m_61.x = _1161;
    out.m_61.y = _1163;
    out.m_61.z = _1165;
    out.m_61.w = _1157;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

