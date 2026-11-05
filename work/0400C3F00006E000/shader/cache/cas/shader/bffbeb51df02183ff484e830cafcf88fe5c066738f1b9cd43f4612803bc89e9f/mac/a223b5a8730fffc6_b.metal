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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1418 = false;
    bool _1142 = false;
    bool _962 = false;
    bool _710 = false;
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
        float _2870 = as_type<float>(_106);
        out.gl_Position.z = _2870;
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
        float _2939 = as_type<float>(_144);
        out.gl_Position.z = _2939;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[15].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[15].x, (*spvDescriptorSet0.vp_c10)._m0[15].x, _150);
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[16].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[15].z, (*spvDescriptorSet0.vp_c10)._m0[15].z, _152);
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[16].x, _154);
    float _160 = sqrt(_156);
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _158);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = sqrt(_162);
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    bool _172 = _160 > 0.0;
    float _174 = sqrt(_170);
    bool _176 = _168 > 0.0;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _178);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _180);
    float _186 = 0.0;
    float _188 = (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _190 = _156;
    float _192 = _162;
    if (_172)
    {
        float _194 = rsqrt(_156);
        _186 = _194;
    }
    float _196 = _186;
    bool _198 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _202 = _198 || _200;
    bool _204 = isnan(1.0);
    bool _206 = _202 || _204;
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _182);
    float _210 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _184);
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = 0.0;
    if (!_172)
    {
        _218 = 0.0;
    }
    float _220 = _218;
    float _222 = 0.0;
    float _224 = _220;
    if (!_172)
    {
        _222 = 0.0;
    }
    float _226 = _222;
    float _228 = in.m_42.x;
    float _230 = in.m_42.y;
    float _232 = in.m_42.z;
    float _234 = 0.0;
    float _236 = _226;
    if (_176)
    {
        float _238 = rsqrt(_162);
        _234 = _238;
    }
    float _240 = _234;
    if (!_172)
    {
        _188 = 0.0;
    }
    float _242 = _188;
    float _244 = _242;
    if (!_176)
    {
        _190 = 0.0;
    }
    float _246 = _190;
    float _248 = 0.0;
    float _250 = _246;
    if (!_206)
    {
        float _252 = _148 * _148;
        float _254 = _252 * 0.5;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    float _260 = _256;
    if (!_176)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _196;
    float _266 = _262;
    if (_172)
    {
        float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
        _224 = _268;
    }
    float _270 = _224;
    float _272 = sqrt(_208);
    if (!_176)
    {
        _192 = 0.0;
    }
    float _274 = _192;
    float _276 = _274;
    if (_172)
    {
        float _278 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
        _236 = _278;
    }
    float _280 = _236;
    if (_172)
    {
        float _282 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
        _244 = _282;
    }
    float _284 = _244;
    if (!_206)
    {
        _264 = _148;
    }
    float _286 = _264;
    float _288 = _286;
    if (!_206)
    {
        float _290 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    float _294 = _292;
    if (_176)
    {
        float _296 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].x;
        _250 = _296;
    }
    float _298 = _250;
    if (_176)
    {
        float _300 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].y;
        _266 = _300;
    }
    float _302 = _266;
    if (_176)
    {
        float _304 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].z;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_206;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = _148 * _312;
        float _322 = 1.0 / _316;
        float _324 = _318 * 0.693147182464599609375;
        float _326 = exp2(_320);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _148);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _338;
    }
    float _340 = _294;
    bool _342 = !_206;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _148 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _288 = _362;
    }
    float _364 = _288;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _272 * _280;
    float _370 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _374 = fma(_364, _212, _366);
    float _376 = _174 * _270;
    float _378 = _368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _382 = _368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _384 = 0.0;
    float _386 = _372;
    float _388 = _376;
    if (!_206)
    {
        float _390 = _124 * _124;
        float _392 = _390 * 0.5;
        _384 = _392;
    }
    float _394 = _384;
    float _396 = fma(_364, _214, _370);
    float _398 = fma(_364, _216, _372);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _378);
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _380);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _382);
    if (!_206)
    {
        _386 = _124;
    }
    float _406 = _386;
    float _408 = _406;
    if (!_206)
    {
        float _410 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _410;
    }
    float _412 = _388;
    bool _414 = !_206;
    float _416 = _412;
    if (!_414)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = _124 * _420;
        float _430 = 1.0 / _424;
        float _432 = _426 * 0.693147182464599609375;
        float _434 = exp2(_428);
        float _436 = 1.0 / _432;
        float _438 = _434 + (-1.0);
        float _440 = -_438;
        float _442 = fma(_440, _436, _124);
        float _444 = _442 * _430;
        float _446 = _444 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _416 = _446;
    }
    float _448 = _416;
    bool _450 = !_206;
    if (!_450)
    {
        float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _454 = log2(_452);
        float _456 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _458 = _456 + 1.0;
        float _460 = 1.0 / _458;
        float _462 = _124 * _454;
        float _464 = exp2(_462);
        float _466 = -_464;
        float _468 = _466 + 1.0;
        float _470 = _468 * _460;
        _408 = _470;
    }
    float _472 = _408;
    float _474 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _476 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _478 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = sqrt(_210);
    float _482 = fma(_472, _214, _474);
    float _484 = fma(_472, _212, _476);
    float _486 = fma(_472, _216, _478);
    float _488 = _272 * _302;
    float _490 = -_482;
    float _492 = _396 + _490;
    float _494 = -_484;
    float _496 = _374 + _494;
    float _498 = _174 * _298;
    float _500 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _502 = _492 * _492;
    float _504 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _506 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _508 = -_486;
    float _510 = _398 + _508;
    float _512 = fma(_496, _496, _502);
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _500);
    float _516 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[25].x, _504);
    float _518 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[26].x, _506);
    float _520 = _480 * _284;
    float _522 = fma(_510, _510, _512);
    float _524 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _526 = fma(_374, _146, _228);
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _402);
    float _530 = sqrt(_522);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _400);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _404);
    float _536 = fma(_396, _146, _230);
    float _538 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _540 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].y, _524);
    float _542 = fma(_398, _146, _232);
    float _544 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _546 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _548 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].x, _538);
    float _550 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].y, _540);
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].z, _544);
    float _554 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].w, _546);
    float _556 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].x, _548);
    float _558 = _272 * _550;
    float _560 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].z, _552);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].w, _554);
    float _564 = _174 * _556;
    float _566 = _558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _570 = _530 >= 9.9999999747524270787835121154785e-07;
    bool _572 = isnan(_530);
    bool _574 = _570 || _572;
    bool _576 = isnan(9.9999999747524270787835121154785e-07);
    bool _578 = _574 || _576;
    float _580 = _558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _582 = _480 * _560;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _586 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _568);
    float _588 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _580);
    float _590 = _480 * _306;
    float _592 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _584);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _586);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _588);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[24].w, _592);
    float _600 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[25].w, _594);
    float _602 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[26].w, _596);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _514);
    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _516);
    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    float _610 = _532 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _612 = _528 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _614 = _534 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _616 = _596;
    float _618 = _562;
    float _620 = _602;
    float _622 = _610;
    float _624 = _612;
    float _626 = _614;
    if (_578)
    {
        _616 = _598;
    }
    float _628 = _616;
    float _630 = _628;
    if (_578)
    {
        _618 = _600;
    }
    float _632 = _618;
    float _634 = _632;
    if (!_578)
    {
        bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _638 = !_636;
        if (!_638)
        {
            float _640 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _642 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _644 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _646 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
            float _648 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
            float _650 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
            float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
            float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
            float _656 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _658 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
            float _660 = _272 * _652;
            float _662 = _174 * _654;
            float _664 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _656);
            float _666 = _480 * _658;
            float _668 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _664);
            float _674 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _676 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
            float _678 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
            float _680 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
            float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
            float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
            float _686 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
            float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
            float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
            float _692 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
            float _694 = _688 * _688;
            float _696 = fma(_690, _690, _694);
            float _698 = fma(_692, _692, _696);
            float _700 = rsqrt(_698);
            float _702 = _700 * 9.9999999747524270787835121154785e-07;
            float _704 = _690 * _702;
            float _706 = _688 * _702;
            float _708 = _692 * _702;
            _634 = _706;
            _630 = _704;
            _620 = _708;
            _710 = true;
        }
        else
        {
            float _712 = _214 * _214;
            float _714 = fma(_212, _212, _712);
            float _716 = fma(_216, _216, _714);
            float _718 = sqrt(_716);
            bool _720 = _718 >= 9.9999999747524270787835121154785e-07;
            bool _722 = isnan(_718);
            bool _724 = _720 || _722;
            bool _726 = isnan(9.9999999747524270787835121154785e-07);
            bool _728 = _724 || _726;
            if (!_728)
            {
                float _730 = _230 * _230;
                float _732 = fma(_228, _228, _730);
                float _734 = fma(_232, _232, _732);
                float _736 = sqrt(_734);
                bool _738 = _736 >= 9.9999999747524270787835121154785e-07;
                bool _740 = isnan(_736);
                bool _742 = _738 || _740;
                bool _744 = isnan(9.9999999747524270787835121154785e-07);
                bool _746 = _742 || _744;
                if (!_746)
                {
                    float _748 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _750 = _174 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _752 = _480 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _754 = _748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _756 = _748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _760 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _754);
                    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _756);
                    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _758);
                    float _766 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
                    float _768 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _762);
                    float _770 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _764);
                    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _766);
                    float _774 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _768);
                    float _776 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _770);
                    float _778 = _772 * _772;
                    float _780 = fma(_774, _774, _778);
                    float _782 = fma(_776, _776, _780);
                    float _784 = rsqrt(_782);
                    float _786 = _784 * 9.9999999747524270787835121154785e-07;
                    float _788 = _774 * _786;
                    float _790 = _772 * _786;
                    float _792 = _776 * _786;
                    _634 = _790;
                    _630 = _788;
                    _620 = _792;
                    _710 = true;
                }
                else
                {
                    float _794 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _796 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _798 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _800 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _802 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].y, _794);
                    float _804 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].x, _796);
                    float _806 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].z, _798);
                    float _808 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].w, _800);
                    float _810 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].y, _802);
                    float _812 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].x, _804);
                    float _814 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].w, _808);
                    float _816 = _272 * _810;
                    float _818 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].z, _806);
                    float _820 = _174 * _812;
                    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _826 = _480 * _818;
                    float _828 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _830 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
                    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
                    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _828);
                    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _830);
                    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
                    float _840 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
                    float _842 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].w, _836);
                    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].w, _838);
                    float _846 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].w, _840);
                    float _848 = _842 * _842;
                    float _850 = fma(_844, _844, _848);
                    float _852 = fma(_846, _846, _850);
                    float _854 = rsqrt(_852);
                    float _856 = _854 * 9.9999999747524270787835121154785e-07;
                    float _858 = _844 * _856;
                    float _860 = _842 * _856;
                    float _862 = _846 * _856;
                    _634 = _860;
                    _630 = _858;
                    _620 = _862;
                    _710 = true;
                }
            }
            else
            {
                float _864 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _866 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _868 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _870 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _872 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].y, _864);
                float _874 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].x, _866);
                float _876 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].z, _868);
                float _878 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].w, _870);
                float _880 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].y, _872);
                float _882 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].x, _874);
                float _884 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].w, _878);
                float _886 = _272 * _880;
                float _888 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].z, _876);
                float _890 = _174 * _882;
                float _892 = _886 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _894 = _480 * _888;
                float _896 = _886 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
                float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
                float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
                float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
                float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _902);
                float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
                float _912 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].w, _906);
                float _914 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].w, _908);
                float _916 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].w, _910);
                float _918 = _912 * _912;
                float _920 = fma(_914, _914, _918);
                float _922 = fma(_916, _916, _920);
                float _924 = rsqrt(_922);
                float _926 = _924 * 9.9999999747524270787835121154785e-07;
                float _928 = _914 * _926;
                float _930 = _912 * _926;
                float _932 = _916 * _926;
                _634 = _930;
                _630 = _928;
                _620 = _932;
            }
        }
    }
    _710 = false;
    float _934 = _634;
    float _936 = _630;
    float _938 = _620;
    bool _940 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _942 = !_940;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_90);
        float _966 = 1.0 / _964;
        float _968 = _124 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _974 = _970 + _972;
    bool _976 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _978 = isnan(_970);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _990 = _970 + _988;
    bool _992 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _994 = isnan(_970);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1012 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1014 = isnan(_970);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -_986;
    float _1026 = _1024 + 1.0;
    float _1028 = 1.0 / _1010;
    float _1030 = _1022 * _1026;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1036;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _1042 = 1.0 / _1006;
    float _1044 = _1002 * _1034;
    float _1046 = -_1002;
    float _1048 = _1046 + 1.0;
    float _1050 = _990 * _1028;
    float _1052 = _974 * _1042;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1058;
    float _1062 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1064 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1066 = fma(_1060, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1068 = in.m_49.x;
    float _1070 = in.m_49.y;
    float _1072 = in.m_49.z;
    float _1074 = _1062 * _1044;
    float _1076 = _1064 * _1044;
    float _1078 = _1066 * _1044;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1074);
    float _1094 = fma(_1082, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1096 = fma(_1086, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1098 = fma(_1090, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1100 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1076);
    float _1102 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1078);
    float _1104 = fma(_1094, _1030, _1092);
    float _1106 = fma(_1096, _1030, _1100);
    float _1108 = fma(_1098, _1030, _1102);
    float _1110 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1104);
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1106);
    float _1114 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1108);
    float _1116 = _1110 * _1068;
    float _1118 = _1112 * _1070;
    float _1120 = _1114 * _1072;
    bool _1122 = !_1040;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_51.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_90);
        float _1146 = 1.0 / _1144;
        float _1148 = _124 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1154 = _1150 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1158 = _1150 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1162 = _1150 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1180 = 1.0 / _1166;
    bool _1182 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1184 = isnan(_1150);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    bool _1194 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1196 = isnan(_1150);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = 1.0 / _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1210 = _1150 + _1208;
    float _1212 = 1.0 / _1170;
    float _1214 = _1154 * _1180;
    bool _1216 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1218 = isnan(_1150);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1230 = 1.0 / _1174;
    float _1232 = _1210 * _1206;
    bool _1234 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1236 = isnan(_1150);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -_1226;
    float _1248 = _1246 + 1.0;
    float _1250 = -_1244;
    float _1252 = _1250 + 1.0;
    float _1254 = _1158 * _1212;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1256;
    float _1260 = _1192 * _1252;
    float _1262 = -_1192;
    float _1264 = _1262 + 1.0;
    float _1266 = fma(_1258, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = _1162 * _1230;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = fma(_1272, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1280 = fma(_1276, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1282 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_1150);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _1226 * _1264;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1308 = _1292 * _1248;
    float _1310 = -_1292;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1302, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1316 = fma(_1298, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1318 = fma(_1306, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1320 = _1204 * _1312;
    float _1322 = _1278 * _1320;
    float _1324 = _1266 * _1320;
    float _1326 = -_1204;
    float _1328 = _1326 + 1.0;
    float _1330 = _1280 * _1320;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1340;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1324);
    float _1346 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1322);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1330);
    float _1350 = fma(_1334, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1352 = fma(_1338, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1354 = fma(_1342, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1356 = fma(_1314, _1308, _1344);
    float _1358 = fma(_1316, _1308, _1346);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1368 = fma(_1318, _1308, _1348);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1374 = fma(_1350, _1294, _1356);
    float _1376 = fma(_1362, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1378 = fma(_1366, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1380 = fma(_1352, _1294, _1358);
    float _1382 = fma(_1372, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1384 = fma(_1354, _1294, _1368);
    float _1386 = fma(_1376, _1260, _1374);
    float _1388 = fma(_1378, _1260, _1380);
    float _1390 = fma(_1382, _1260, _1384);
    float _1392 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1386);
    float _1394 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1388);
    float _1396 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1390);
    bool _1398 = !_1228;
    float _1416;
    if (!_1398)
    {
        float _1400 = in.m_51.x;
        float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1404 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _1408 = _1406 * _1402;
        float _1410 = floor(_1408);
        float _1412 = -_1410;
        float _1414 = _1408 + _1412;
        _1416 = _1414;
        _1418 = true;
    }
    else
    {
        float _1420 = float(_90);
        float _1422 = 1.0 / _1420;
        float _1424 = _124 * _1422;
        _1416 = _1424;
    }
    _1418 = false;
    float _1426 = _1416;
    float _1428 = in.m_51.z;
    float _1430 = _934 * _934;
    float _1432 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1434 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1436 = in.m_51.x;
    float _1438 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1440 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = in.m_51.y;
    float _1448 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1432);
    float _1450 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1434);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    float _1464 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1438);
    float _1466 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1440);
    float _1468 = _604 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _606 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1476 = _608 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1478 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1448);
    int _1480 = abs(_1472);
    float _1482 = _1444 * _124;
    float _1484 = _1428 * 2.0;
    float _1486 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1450);
    float _1490 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1464);
    float _1492 = _1436 * 2.0;
    float _1494 = floor(_1484);
    float _1496 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1466);
    float _1498 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1500 = _1446 * 2.0;
    float _1502 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1504 = _1490 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1508 = floor(_1492);
    float _1510 = fma(_936, _936, _1430);
    float _1512 = _272 * _1502;
    float _1514 = _480 * _1504;
    float _1516 = fma(_938, _938, _1510);
    float _1518 = _1436 + _1446;
    float _1520 = floor(_1500);
    float _1522 = _1446 + _1428;
    bool _1524 = _1494 > 0.0;
    float _1526 = _1518 + (-1.0);
    bool _1528 = _1494 >= 0.0;
    bool _1530 = isnan(_1494);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = _1522 + (-1.0);
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1542 = _1508 > 0.0;
    float _1544 = rsqrt(_1516);
    bool _1546 = _1508 >= 0.0;
    bool _1548 = isnan(_1508);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1558 = _1536 ? 0 : 1;
    int _1560 = _1554 ? 0 : 1;
    int _1562 = ~_1558;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1482);
    int _1570 = ~_1560;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = _1566;
    int _1578 = _1574;
    float _1580 = _1506;
    if (!_1524)
    {
        int _1582 = ~_1558;
        int _1584 = _1582 + 1;
        _1576 = _1584;
    }
    int _1586 = _1576;
    if (!_1542)
    {
        int _1588 = ~_1560;
        int _1590 = _1588 + 1;
        _1578 = _1590;
    }
    int _1592 = _1578;
    float _1594 = in.m_53.x;
    float _1596 = in.m_53.y;
    float _1598 = in.m_53.z;
    float _1600 = _1544 * _934;
    bool _1602 = _1520 > 0.0;
    float _1604 = _1544 * _936;
    bool _1606 = _1520 >= 0.0;
    bool _1608 = isnan(_1520);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1618 = 1.0 + _1616;
    bool _1620 = !_1454;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _612 * _1600;
    float _1626 = float(_1586);
    float _1628 = 1.0 / _1618;
    int _1630 = abs(_1622);
    float _1632 = _1544 * _938;
    float _1634 = fma(_610, _1604, _1624);
    bool _1636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1638 = isnan(1.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1644 = _1640 || _1642;
    float _1646 = -_1568;
    float _1648 = _1646 + 1.0;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    int _1660 = _1614 ? 0 : 1;
    float _1662 = float(_1630);
    float _1664 = float(_1480);
    float _1666 = _1658 ? _1648 : 0.0;
    float _1668 = _1662 * _1626;
    float _1670 = fma(_614, _1632, _1634);
    int _1672 = ~_1660;
    int _1674 = _1672 + 1;
    int _1676 = _1674 + 1;
    float _1678 = _1668 * (-2.0);
    int _1680 = _1676;
    float _1682 = _1604;
    if (!_1602)
    {
        int _1684 = ~_1660;
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    if (_1644)
    {
        float _1690 = _1666 * _1628;
        _128 = _1690;
    }
    float _1692 = _128;
    float _1694 = abs(_1670);
    bool _1696 = _1694 > 0.99989998340606689453125;
    float _1698 = _1436 + (-0.5);
    float _1700 = fma(_1678, _1594, _1594);
    bool _1702 = !_1462;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = fma(_1540, _1678, _1540);
    float _1708 = float(_1592);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1700);
    int _1712 = abs(_1704);
    float _1714 = _1436 + _1428;
    float _1716 = _1428 + (-0.5);
    float _1718 = fma(_1706, _1692, _1710);
    float _1720 = float(_1712);
    float _1722 = _1664 * _1708;
    float _1724 = float(_1688);
    float _1726 = _1714 + (-1.0);
    float _1728 = in.m_55.x;
    float _1730 = in.m_55.y;
    float _1732 = in.m_55.z;
    float _1734 = _1722 * (-2.0);
    if (_1696)
    {
        float _1736 = fma(_1468, 0.001000000047497451305389404296875, _610);
        _622 = _1736;
    }
    float _1738 = _622;
    float _1740 = _1720 * _1724;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1744 = fma(_1556, _1734, _1556);
    float _1746 = fma(_1734, _1596, _1596);
    float _1748 = _1740 * (-2.0);
    float _1750 = _1446 + (-0.5);
    if (_1696)
    {
        float _1752 = fma(_1474, 0.001000000047497451305389404296875, _612);
        _624 = _1752;
    }
    float _1754 = _624;
    if (_1696)
    {
        float _1756 = fma(_1476, 0.001000000047497451305389404296875, _614);
        _626 = _1756;
    }
    float _1758 = _626;
    float _1760 = fma(_1742, _1748, _1742);
    float _1762 = fma(_1748, _1598, _1598);
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1746);
    float _1766 = -_1738;
    float _1768 = _1632 * _1766;
    float _1770 = -_1758;
    float _1772 = _1600 * _1770;
    float _1774 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1762);
    float _1776 = fma(_1744, _1692, _1764);
    float _1778 = _1718 * 0.15915493667125701904296875;
    float _1780 = fma(_1760, _1692, _1774);
    float _1782 = -_1758;
    float _1784 = -_1768;
    float _1786 = fma(_1604, _1782, _1784);
    float _1788 = -_1754;
    float _1790 = -_1772;
    float _1792 = fma(_1632, _1788, _1790);
    float _1794 = _1776 * 0.15915493667125701904296875;
    float _1796 = _1780 * 0.15915493667125701904296875;
    float _1798 = -_1754;
    float _1800 = _1604 * _1798;
    float _1802 = _1786 * _1786;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1728);
    float _1806 = _1778 * 6.283185482025146484375;
    float _1808 = sin(_1806);
    float _1810 = -_1738;
    float _1812 = -_1800;
    float _1814 = fma(_1600, _1810, _1812);
    float _1816 = fma(_1792, _1792, _1802);
    float _1818 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1730);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1732);
    float _1824 = fma(_1814, _1814, _1816);
    float _1826 = _1478 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1828 = _1778 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _1818 * _1804;
    float _1834 = _1486 * _1820;
    float _1836 = _174 * _1826;
    float _1838 = _1498 * _1822;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1848 = _1844 || _1846;
    float _1850 = _1794 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1794 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1796 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1808 * _1852;
    float _1864 = _1830 * _1852;
    float _1866 = _1796 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    float _1870 = _1830 * _1856;
    float _1872 = _1808 * _1856;
    float _1874 = rsqrt(_1824);
    float _1876 = _1808 * _1860;
    float _1878 = _1856 * _1860;
    float _1880 = _1830 * _1860;
    float _1882 = _1852 * _1860;
    float _1884 = fma(_1868, _1870, _1862);
    float _1886 = fma(_1868, _1862, _1870);
    float _1888 = -_1864;
    float _1890 = fma(_1868, _1872, _1888);
    float _1892 = -_1872;
    float _1894 = fma(_1868, _1864, _1892);
    float _1896 = _1884 * _1604;
    float _1898 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1894 * _1604;
    float _1902 = _1814 * _1874;
    float _1904 = _1792 * _1874;
    float _1906 = _1880 * _1604;
    float _1908 = _1786 * _1874;
    float _1910 = _1600 * _1902;
    float _1912 = fma(_1878, _1904, _1896);
    float _1914 = -_1868;
    float _1916 = fma(_1914, _1904, _1906);
    float _1918 = fma(_1882, _1904, _1900);
    float _1920 = -_1910;
    float _1922 = fma(_1632, _1908, _1920);
    float _1924 = _1894 * _1632;
    float _1926 = _1894 * _1600;
    float _1928 = fma(_1890, _1922, _1912);
    float _1930 = fma(_1876, _1922, _1916);
    float _1932 = fma(_1886, _1922, _1918);
    float _1934 = _1880 * _1632;
    float _1936 = _1604 * _1908;
    float _1938 = _1884 * _1632;
    float _1940 = _1834 * _1930;
    float _1942 = -_1868;
    float _1944 = fma(_1942, _1902, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1600, _1904, _1946);
    float _1950 = fma(_1878, _1902, _1938);
    float _1952 = fma(_1882, _1902, _1924);
    float _1954 = fma(_1832, _1928, _1940);
    float _1956 = fma(_1876, _1948, _1944);
    float _1958 = fma(_1890, _1948, _1950);
    float _1960 = fma(_1886, _1948, _1952);
    float _1962 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1964 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1966 = _1834 * _1956;
    float _1968 = fma(_1838, _1932, _1954);
    float _1970 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1962);
    float _1972 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _1974 = fma(_1832, _1958, _1966);
    float _1976 = _1632 * _1904;
    float _1978 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1970);
    float _1980 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1972);
    float _1982 = fma(_1838, _1960, _1974);
    float _1984 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1986 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1990 = _1884 * _1600;
    float _1992 = -_1976;
    float _1994 = fma(_1604, _1902, _1992);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1998 = _1988 + _1982;
    float _2000 = _1880 * _1600;
    float _2002 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1984);
    float _2004 = _1996 + _1968;
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2008 = _1998 + _2006;
    float _2010 = -_1868;
    float _2012 = fma(_2010, _1908, _2000);
    float _2014 = fma(_1878, _1908, _1990);
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2018 = _2004 + _2016;
    float _2020 = _2008 * _2008;
    float _2022 = fma(_1876, _1994, _2012);
    float _2024 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2026 = fma(_1882, _1908, _1926);
    float _2028 = fma(_2018, _2018, _2020);
    float _2030 = fma(_1890, _1994, _2014);
    float _2032 = _1834 * _2022;
    float _2034 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2024);
    float _2036 = sqrt(_2028);
    float _2038 = fma(_1886, _1994, _2026);
    float _2040 = fma(_1832, _2030, _2032);
    float _2042 = _2034 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2044 = fma(_1838, _2038, _2040);
    float _2046 = _2042 + _2044;
    bool _2048 = _2036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = _2040;
    float _2052 = _2032;
    float _2054 = _2034;
    float _2056 = _1994;
    float _2058 = 0.5;
    if (!_2048)
    {
        _2050 = _2004;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (!_2048)
    {
        _2052 = _1998;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_2048)
    {
        _2054 = _2046;
    }
    float _2068 = _2054;
    bool _2070 = !_2048;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2036 + _2076;
        float _2080 = rsqrt(_2028);
        float _2082 = _2078 * _2074;
        float _2084 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = _2082 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        float _2096 = fma(_2090, _2084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2098 = _2080 * _2096;
        float _2100 = _2094 + (-1.0);
        float _2102 = fma(_2018, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2104 = fma(_2008, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2108 = fma(_2046, _2094, _2106);
        _2062 = _2102;
        _2072 = _2108;
        _2066 = _2104;
    }
    float _2110 = _2062;
    float _2112 = _2072;
    float _2114 = _2066;
    float _2116 = _2112;
    float _2118 = _2110;
    float _2120 = _2114;
    if (!_1848)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _2042 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1996 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2132 = -_1996;
        float _2134 = _2132 + _2110;
        float _2136 = _2124 * _2124;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2140 = _1988 + _2138;
        float _2142 = -_2042;
        float _2144 = _2142 + _2112;
        float _2146 = fma(_2128, _2128, _2136);
        float _2148 = fma(_2140, _2140, _2146);
        float _2150 = sqrt(_2148);
        float _2152 = precise::min(_2150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2154 = _2152 * _2130;
        float _2156 = -_1988;
        float _2158 = _2156 + _2114;
        float _2160 = fma(_2134, _2154, _1996);
        float _2162 = fma(_2144, _2154, _2042);
        float _2164 = fma(_2158, _2154, _1988);
        _2116 = _2162;
        _2118 = _2160;
        _2120 = _2164;
    }
    float _2166 = _2116;
    float _2168 = _2118;
    float _2170 = _2120;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2166 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2168 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2170 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2186;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    if (_2208)
    {
        float _2222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2222;
    }
    float _2224 = _2214;
    if (_2208)
    {
        float _2226 = rsqrt(_2204);
        _2216 = _2226;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    if (_2208)
    {
        float _2232 = _2212 * _2224;
        _2218 = _2232;
    }
    float _2234 = _2218;
    if (_2208)
    {
        float _2236 = _2234 * 0.15915493667125701904296875;
        _2056 = _2236;
    }
    float _2238 = _2056;
    float _2240 = _2182;
    float _2242 = _2238;
    if (_2208)
    {
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = precise::max(0.0, _2250);
    float _2254 = _2224;
    float _2256 = _2252;
    if (_2208)
    {
        float _2258 = _2238 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2254 = _2260;
    }
    float _2262 = _2254;
    float _2264 = -_2194;
    float _2266 = -_2252;
    float _2268 = fma(_2174, _2264, _2266);
    if (_2208)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2270;
    }
    float _2272 = _2220;
    float _2274 = _2272;
    float _2276 = _2248;
    if (_2208)
    {
        float _2278 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _2280;
    if (!_2208)
    {
        _2276 = _2196;
    }
    float _2284 = _2276;
    float _2286 = _2284;
    float _2288 = _2262;
    if (_2208)
    {
        float _2290 = _2262 + (-1.0);
        _2256 = _2290;
    }
    float _2292 = _2256;
    float _2294 = _2292;
    if (_2208)
    {
        float _2296 = _2228 * _2280;
        _1682 = _2296;
    }
    float _2298 = _1682;
    if (!_2208)
    {
        _2282 = _2268;
    }
    float _2300 = _2282;
    float _2302 = _2300;
    if (_2208)
    {
        float _2304 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2304;
    }
    float _2306 = _2242;
    if (_2208)
    {
        float _2308 = _2196 * _2298;
        _2286 = _2308;
    }
    float _2310 = _2286;
    if (!_2208)
    {
        _2294 = _2198;
    }
    float _2312 = _2294;
    float _2314 = _2312;
    if (_2208)
    {
        float _2316 = _2198 * _2298;
        _2314 = _2316;
    }
    float _2318 = _2314;
    if (!_2208)
    {
        _2230 = _2200;
    }
    float _2320 = _2230;
    float _2322 = _2320;
    if (_2208)
    {
        float _2324 = fma(_2268, _2262, _2306);
        _2302 = _2324;
    }
    float _2326 = _2302;
    if (_2208)
    {
        float _2328 = _2310 * _2310;
        _2322 = _2328;
    }
    float _2330 = _2322;
    if (!_2208)
    {
        _2288 = _2202;
    }
    float _2332 = _2288;
    float _2334 = _2332;
    if (_2208)
    {
        float _2336 = _2318 * _2318;
        _2334 = _2336;
    }
    float _2338 = _2334;
    float _2340 = fma(_2326, _2326, _2330);
    float _2342 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2344 = _2340 + _2338;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2342);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2350 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2348);
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2358 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2346);
    float _2360 = rsqrt(_2344);
    float _2362 = -_2352;
    float _2364 = _2362 + 1.0;
    float _2366 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2370 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2376 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2368);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2370);
    float _2380 = abs(_2364);
    float _2382 = log2(_2380);
    float _2384 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2374);
    float _2386 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2388 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2378);
    float _2390 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2396 = _2360 * _2310;
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = _2360 * _2326;
    float _2402 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2394);
    float _2404 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = _2360 * _2318;
    float _2408 = -_2390;
    float _2410 = fma(_2408, _2356, 1.0);
    float _2412 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2402);
    float _2414 = -_2404;
    float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2414);
    float _2418 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2420 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2412);
    float _2422 = -_2406;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2416);
    float _2426 = exp2(_2418);
    float _2428 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2432 = fma(_2424, -0.5, 0.5);
    float _2434 = fma(_2424, 0.5, 0.5);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2428);
    float _2438 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2430);
    float _2440 = _2400 + 1.0;
    float _2442 = log2(_2410);
    float _2444 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2436);
    float _2446 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = fma(_2434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2450 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2444);
    float _2452 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float _2454 = fma(_2434, _2448, -0.212114393711090087890625);
    float _2456 = 1.0 / _2420;
    float _2458 = -_2400;
    float _2460 = fma(_2426, _2440, _2458);
    float _2462 = fma(_2434, _2454, 1.570728778839111328125);
    float _2464 = sqrt(_2432);
    float _2466 = _2442 * 0.693147182464599609375;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2450 * _2456;
    float _2472 = _2452 * _2456;
    float _2474 = fma(_2470, 0.5, 0.5);
    float _2476 = fma(_2472, -0.5, 0.5);
    float _2478 = fma(_2460, 0.5, 0.5);
    float _2480 = _2464 * 0.636619746685028076171875;
    float3 _6849 = float3(_2474, _2476, _2468);
    float _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6849, float3(0.0), isnan(_6849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6849, float3(0.0), isnan(_6849)), level(0.0)).x;
    float _2484 = -_2462;
    float _2486 = fma(_2480, _2484, 1.0);
    float3 _6865 = float3(_2474, _2476, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6865, float3(0.0), isnan(_6865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6865, float3(0.0), isnan(_6865)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6882 = float2(_2486, _2478);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6882, float2(0.0), isnan(_6882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6882, float2(0.0), isnan(_6882)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = in.m_57.y;
    float _2511 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2513 = in.m_57.x;
    bool _2515 = _1446 > 0.5;
    float _2517 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2525 = _2523 != 0;
    float _2527 = in.m_59.x;
    float _2529 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2517);
    float _2531 = 1.0 / _2521;
    float _2533 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2537 = _2535 != 0;
    float _2539 = _2529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2541 = _1436 > 0.5;
    bool _2543 = _2541 && _2525;
    float _2545 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2533);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2549 = _1426 + _2547;
    float _2551 = 1.0 / _2539;
    bool _2553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2565;
    float _2569 = in.m_59.y;
    float _2571 = -_2509;
    float _2573 = _2571 + 1.0;
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2577 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2579 = _2567 * _2531;
    float _2581 = _2509;
    float _2583 = _2579;
    float _2585 = _2513;
    if (_2525)
    {
        _2058 = _2513;
    }
    float _2587 = _2058;
    float _2589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2591 = _2587;
    if (_2537)
    {
        float _2593 = _2515 ? _2573 : _2509;
        _2581 = _2593;
    }
    float _2595 = _2581;
    float _2597 = _2575 + _2539;
    float _2599 = fma(_2579, _2549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (!_2525)
    {
        _2583 = _2513;
    }
    float _2601 = _2583;
    out.m_61.x = _2527;
    float _2603 = _2527;
    float _2605 = _2601;
    if (!_2561)
    {
        _2585 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2607 = _2585;
    float _2609 = _2597 * _2551;
    float _2611 = _2609 * 0.5;
    float _2613 = _2607;
    if (!_2561)
    {
        _1580 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2615 = _1580;
    float _2617 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2543)
    {
        float _2619 = -_2587;
        float _2621 = _2619 + 1.0;
        _2591 = _2621;
    }
    float _2623 = _2591;
    if (!_2561)
    {
        float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2627 = fma(_2611, _2607, _2625);
        _2613 = _2627;
    }
    float _2629 = _2613;
    float _2631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2561)
    {
        float _2633 = -_2615;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2635;
    }
    float _2637 = _2603;
    bool _2639 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2641 = isnan(_1426);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2647 = _2643 || _2645;
    float _2649 = float(_2647);
    float _2651 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2653 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2655 = isnan(_1426);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = _2617 * _2589;
    float _2667 = -_2649;
    float _2669 = _2667 + 1.0;
    float _2671 = _2629;
    if (!_2561)
    {
        float _2673 = 1.0 / _2629;
        _2671 = _2673;
    }
    float _2675 = _2671;
    out.m_61.y = _2569;
    if (_2525)
    {
        _2605 = _2623;
    }
    float _2677 = _2605;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2681 = _2663 * _2669;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2685 = -_2663;
    float _2687 = _2685 + 1.0;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2691 = _2687;
    if (!_2561)
    {
        float _2693 = 1.0 / _2637;
        _2689 = _2693;
    }
    float _2695 = _2689;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = _2599 * _2681;
    float _2705 = _2697 * _2631;
    float _2707 = in.m_59.z;
    float _2709 = _2697;
    if (!_2561)
    {
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2713 = -_2615;
        float _2715 = fma(_2675, _2711, _2713);
        _2709 = _2715;
    }
    float _2717 = _2709;
    float _2719 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2703);
    if (_2561)
    {
        _2691 = 1.0;
    }
    float _2721 = _2691;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2725 = in.m_59.w;
    float _2727 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2721;
    if (!_2561)
    {
        float _2733 = _2717 * _2695;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2731 = _2735;
    }
    float _2737 = _2731;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2741 = exp2(_2577);
    float _2743 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2719);
    float _2745 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    bool _2747 = _2737 > 0.0;
    bool _2749 = isnan(_2737);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    out.m_63.x = _2729;
    out.m_63.y = _2699;
    out.m_63.z = _2701;
    out.m_63.w = _2739;
    float _2757 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2745);
    out.m_65.x = _2705;
    out.m_65.y = _2665;
    float _2759 = _2450 + _2420;
    float _2761 = _2757 + _2420;
    out.gl_Position.x = _2450;
    out.gl_Position.y = _2452;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2420;
    float _2763 = _2759 * 0.5;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2741;
    float _2769 = _2767 + 1.0;
    out.m_61.z = _2707;
    float _2771 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2773 = _2420 * 0.5;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2777 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2779 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2781 = fma(_2452, -0.5, _2773);
    float _2783 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.w = _2725;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    out.m_69.x = _2763;
    out.m_69.y = _2781;
    out.m_69.z = _2765;
    out.m_69.w = _2420;
    out.m_45.x = _2793;
    float _2795 = _2775 * _2482;
    float _2797 = -_2775;
    float _2799 = _2797 + 1.0;
    float _2801 = _2497 * _2795;
    float _2803 = _2497 * _2799;
    float _2805 = _2507 * _2795;
    float _2807 = fma(_2503, _2801, _2491);
    float _2809 = fma(_2505, _2801, _2493);
    float _2811 = fma(_2497, _2805, _2495);
    out.m_71.x = _2807;
    out.m_71.y = _2809;
    out.m_71.z = _2811;
    out.m_71.w = _2803;
    if (_2755)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1418 = false;
    bool _1142 = false;
    bool _962 = false;
    bool _710 = false;
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
        float _2870 = as_type<float>(_106);
        out.gl_Position.z = _2870;
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
        float _2939 = as_type<float>(_144);
        out.gl_Position.z = _2939;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[15].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[15].x, (*spvDescriptorSet0.vp_c10)._m0[15].x, _150);
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[16].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[15].z, (*spvDescriptorSet0.vp_c10)._m0[15].z, _152);
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[16].x, _154);
    float _160 = sqrt(_156);
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _158);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = sqrt(_162);
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    bool _172 = _160 > 0.0;
    float _174 = sqrt(_170);
    bool _176 = _168 > 0.0;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _178);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _180);
    float _186 = 0.0;
    float _188 = (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _190 = _156;
    float _192 = _162;
    if (_172)
    {
        float _194 = rsqrt(_156);
        _186 = _194;
    }
    float _196 = _186;
    bool _198 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _202 = _198 || _200;
    bool _204 = isnan(1.0);
    bool _206 = _202 || _204;
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _182);
    float _210 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _184);
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = 0.0;
    if (!_172)
    {
        _218 = 0.0;
    }
    float _220 = _218;
    float _222 = 0.0;
    float _224 = _220;
    if (!_172)
    {
        _222 = 0.0;
    }
    float _226 = _222;
    float _228 = in.m_42.x;
    float _230 = in.m_42.y;
    float _232 = in.m_42.z;
    float _234 = 0.0;
    float _236 = _226;
    if (_176)
    {
        float _238 = rsqrt(_162);
        _234 = _238;
    }
    float _240 = _234;
    if (!_172)
    {
        _188 = 0.0;
    }
    float _242 = _188;
    float _244 = _242;
    if (!_176)
    {
        _190 = 0.0;
    }
    float _246 = _190;
    float _248 = 0.0;
    float _250 = _246;
    if (!_206)
    {
        float _252 = _148 * _148;
        float _254 = _252 * 0.5;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    float _260 = _256;
    if (!_176)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _196;
    float _266 = _262;
    if (_172)
    {
        float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
        _224 = _268;
    }
    float _270 = _224;
    float _272 = sqrt(_208);
    if (!_176)
    {
        _192 = 0.0;
    }
    float _274 = _192;
    float _276 = _274;
    if (_172)
    {
        float _278 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
        _236 = _278;
    }
    float _280 = _236;
    if (_172)
    {
        float _282 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
        _244 = _282;
    }
    float _284 = _244;
    if (!_206)
    {
        _264 = _148;
    }
    float _286 = _264;
    float _288 = _286;
    if (!_206)
    {
        float _290 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    float _294 = _292;
    if (_176)
    {
        float _296 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].x;
        _250 = _296;
    }
    float _298 = _250;
    if (_176)
    {
        float _300 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].y;
        _266 = _300;
    }
    float _302 = _266;
    if (_176)
    {
        float _304 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].z;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_206;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = _148 * _312;
        float _322 = 1.0 / _316;
        float _324 = _318 * 0.693147182464599609375;
        float _326 = exp2(_320);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _148);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _338;
    }
    float _340 = _294;
    bool _342 = !_206;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _148 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _288 = _362;
    }
    float _364 = _288;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _272 * _280;
    float _370 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _374 = fma(_364, _212, _366);
    float _376 = _174 * _270;
    float _378 = _368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _382 = _368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _384 = 0.0;
    float _386 = _372;
    float _388 = _376;
    if (!_206)
    {
        float _390 = _124 * _124;
        float _392 = _390 * 0.5;
        _384 = _392;
    }
    float _394 = _384;
    float _396 = fma(_364, _214, _370);
    float _398 = fma(_364, _216, _372);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _378);
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _380);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _382);
    if (!_206)
    {
        _386 = _124;
    }
    float _406 = _386;
    float _408 = _406;
    if (!_206)
    {
        float _410 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _410;
    }
    float _412 = _388;
    bool _414 = !_206;
    float _416 = _412;
    if (!_414)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = _124 * _420;
        float _430 = 1.0 / _424;
        float _432 = _426 * 0.693147182464599609375;
        float _434 = exp2(_428);
        float _436 = 1.0 / _432;
        float _438 = _434 + (-1.0);
        float _440 = -_438;
        float _442 = fma(_440, _436, _124);
        float _444 = _442 * _430;
        float _446 = _444 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _416 = _446;
    }
    float _448 = _416;
    bool _450 = !_206;
    if (!_450)
    {
        float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _454 = log2(_452);
        float _456 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _458 = _456 + 1.0;
        float _460 = 1.0 / _458;
        float _462 = _124 * _454;
        float _464 = exp2(_462);
        float _466 = -_464;
        float _468 = _466 + 1.0;
        float _470 = _468 * _460;
        _408 = _470;
    }
    float _472 = _408;
    float _474 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _476 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _478 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = sqrt(_210);
    float _482 = fma(_472, _214, _474);
    float _484 = fma(_472, _212, _476);
    float _486 = fma(_472, _216, _478);
    float _488 = _272 * _302;
    float _490 = -_482;
    float _492 = _396 + _490;
    float _494 = -_484;
    float _496 = _374 + _494;
    float _498 = _174 * _298;
    float _500 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _502 = _492 * _492;
    float _504 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _506 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _508 = -_486;
    float _510 = _398 + _508;
    float _512 = fma(_496, _496, _502);
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _500);
    float _516 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[25].x, _504);
    float _518 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[26].x, _506);
    float _520 = _480 * _284;
    float _522 = fma(_510, _510, _512);
    float _524 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _526 = fma(_374, _146, _228);
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _402);
    float _530 = sqrt(_522);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _400);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _404);
    float _536 = fma(_396, _146, _230);
    float _538 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _540 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].y, _524);
    float _542 = fma(_398, _146, _232);
    float _544 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _546 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _548 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].x, _538);
    float _550 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].y, _540);
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].z, _544);
    float _554 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].w, _546);
    float _556 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].x, _548);
    float _558 = _272 * _550;
    float _560 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].z, _552);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].w, _554);
    float _564 = _174 * _556;
    float _566 = _558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _570 = _530 >= 9.9999999747524270787835121154785e-07;
    bool _572 = isnan(_530);
    bool _574 = _570 || _572;
    bool _576 = isnan(9.9999999747524270787835121154785e-07);
    bool _578 = _574 || _576;
    float _580 = _558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _582 = _480 * _560;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _586 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _568);
    float _588 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _580);
    float _590 = _480 * _306;
    float _592 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _584);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _586);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _588);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[24].w, _592);
    float _600 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[25].w, _594);
    float _602 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[26].w, _596);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _514);
    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _516);
    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    float _610 = _532 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _612 = _528 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _614 = _534 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _616 = _596;
    float _618 = _562;
    float _620 = _602;
    float _622 = _610;
    float _624 = _612;
    float _626 = _614;
    if (_578)
    {
        _616 = _598;
    }
    float _628 = _616;
    float _630 = _628;
    if (_578)
    {
        _618 = _600;
    }
    float _632 = _618;
    float _634 = _632;
    if (!_578)
    {
        bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _638 = !_636;
        if (!_638)
        {
            float _640 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _642 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _644 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _646 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
            float _648 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
            float _650 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
            float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
            float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
            float _656 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _658 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
            float _660 = _272 * _652;
            float _662 = _174 * _654;
            float _664 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _656);
            float _666 = _480 * _658;
            float _668 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _664);
            float _674 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _676 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
            float _678 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
            float _680 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
            float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
            float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
            float _686 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
            float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
            float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
            float _692 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
            float _694 = _688 * _688;
            float _696 = fma(_690, _690, _694);
            float _698 = fma(_692, _692, _696);
            float _700 = rsqrt(_698);
            float _702 = _700 * 9.9999999747524270787835121154785e-07;
            float _704 = _690 * _702;
            float _706 = _688 * _702;
            float _708 = _692 * _702;
            _634 = _706;
            _630 = _704;
            _620 = _708;
            _710 = true;
        }
        else
        {
            float _712 = _214 * _214;
            float _714 = fma(_212, _212, _712);
            float _716 = fma(_216, _216, _714);
            float _718 = sqrt(_716);
            bool _720 = _718 >= 9.9999999747524270787835121154785e-07;
            bool _722 = isnan(_718);
            bool _724 = _720 || _722;
            bool _726 = isnan(9.9999999747524270787835121154785e-07);
            bool _728 = _724 || _726;
            if (!_728)
            {
                float _730 = _230 * _230;
                float _732 = fma(_228, _228, _730);
                float _734 = fma(_232, _232, _732);
                float _736 = sqrt(_734);
                bool _738 = _736 >= 9.9999999747524270787835121154785e-07;
                bool _740 = isnan(_736);
                bool _742 = _738 || _740;
                bool _744 = isnan(9.9999999747524270787835121154785e-07);
                bool _746 = _742 || _744;
                if (!_746)
                {
                    float _748 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _750 = _174 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _752 = _480 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _754 = _748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _756 = _748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _760 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _754);
                    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _756);
                    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _758);
                    float _766 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
                    float _768 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _762);
                    float _770 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _764);
                    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _766);
                    float _774 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _768);
                    float _776 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _770);
                    float _778 = _772 * _772;
                    float _780 = fma(_774, _774, _778);
                    float _782 = fma(_776, _776, _780);
                    float _784 = rsqrt(_782);
                    float _786 = _784 * 9.9999999747524270787835121154785e-07;
                    float _788 = _774 * _786;
                    float _790 = _772 * _786;
                    float _792 = _776 * _786;
                    _634 = _790;
                    _630 = _788;
                    _620 = _792;
                    _710 = true;
                }
                else
                {
                    float _794 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _796 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _798 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _800 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _802 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].y, _794);
                    float _804 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].x, _796);
                    float _806 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].z, _798);
                    float _808 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].w, _800);
                    float _810 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].y, _802);
                    float _812 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].x, _804);
                    float _814 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].w, _808);
                    float _816 = _272 * _810;
                    float _818 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].z, _806);
                    float _820 = _174 * _812;
                    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _826 = _480 * _818;
                    float _828 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _830 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
                    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
                    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _828);
                    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _830);
                    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
                    float _840 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
                    float _842 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].w, _836);
                    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].w, _838);
                    float _846 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].w, _840);
                    float _848 = _842 * _842;
                    float _850 = fma(_844, _844, _848);
                    float _852 = fma(_846, _846, _850);
                    float _854 = rsqrt(_852);
                    float _856 = _854 * 9.9999999747524270787835121154785e-07;
                    float _858 = _844 * _856;
                    float _860 = _842 * _856;
                    float _862 = _846 * _856;
                    _634 = _860;
                    _630 = _858;
                    _620 = _862;
                    _710 = true;
                }
            }
            else
            {
                float _864 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _866 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _868 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _870 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _872 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].y, _864);
                float _874 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].x, _866);
                float _876 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].z, _868);
                float _878 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].w, _870);
                float _880 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].y, _872);
                float _882 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].x, _874);
                float _884 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].w, _878);
                float _886 = _272 * _880;
                float _888 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].z, _876);
                float _890 = _174 * _882;
                float _892 = _886 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _894 = _480 * _888;
                float _896 = _886 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
                float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
                float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
                float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
                float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _902);
                float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
                float _912 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].w, _906);
                float _914 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].w, _908);
                float _916 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].w, _910);
                float _918 = _912 * _912;
                float _920 = fma(_914, _914, _918);
                float _922 = fma(_916, _916, _920);
                float _924 = rsqrt(_922);
                float _926 = _924 * 9.9999999747524270787835121154785e-07;
                float _928 = _914 * _926;
                float _930 = _912 * _926;
                float _932 = _916 * _926;
                _634 = _930;
                _630 = _928;
                _620 = _932;
            }
        }
    }
    _710 = false;
    float _934 = _634;
    float _936 = _630;
    float _938 = _620;
    bool _940 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _942 = !_940;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_90);
        float _966 = 1.0 / _964;
        float _968 = _124 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _974 = _970 + _972;
    bool _976 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _978 = isnan(_970);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _990 = _970 + _988;
    bool _992 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _994 = isnan(_970);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1012 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1014 = isnan(_970);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -_986;
    float _1026 = _1024 + 1.0;
    float _1028 = 1.0 / _1010;
    float _1030 = _1022 * _1026;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1036;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _1042 = 1.0 / _1006;
    float _1044 = _1002 * _1034;
    float _1046 = -_1002;
    float _1048 = _1046 + 1.0;
    float _1050 = _990 * _1028;
    float _1052 = _974 * _1042;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1058;
    float _1062 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1064 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1066 = fma(_1060, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1068 = in.m_49.x;
    float _1070 = in.m_49.y;
    float _1072 = in.m_49.z;
    float _1074 = _1062 * _1044;
    float _1076 = _1064 * _1044;
    float _1078 = _1066 * _1044;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1074);
    float _1094 = fma(_1082, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1096 = fma(_1086, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1098 = fma(_1090, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1100 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1076);
    float _1102 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1078);
    float _1104 = fma(_1094, _1030, _1092);
    float _1106 = fma(_1096, _1030, _1100);
    float _1108 = fma(_1098, _1030, _1102);
    float _1110 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1104);
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1106);
    float _1114 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1108);
    float _1116 = _1110 * _1068;
    float _1118 = _1112 * _1070;
    float _1120 = _1114 * _1072;
    bool _1122 = !_1040;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_51.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_90);
        float _1146 = 1.0 / _1144;
        float _1148 = _124 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1154 = _1150 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1158 = _1150 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1162 = _1150 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1180 = 1.0 / _1166;
    bool _1182 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1184 = isnan(_1150);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    bool _1194 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1196 = isnan(_1150);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = 1.0 / _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1210 = _1150 + _1208;
    float _1212 = 1.0 / _1170;
    float _1214 = _1154 * _1180;
    bool _1216 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1218 = isnan(_1150);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1230 = 1.0 / _1174;
    float _1232 = _1210 * _1206;
    bool _1234 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1236 = isnan(_1150);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -_1226;
    float _1248 = _1246 + 1.0;
    float _1250 = -_1244;
    float _1252 = _1250 + 1.0;
    float _1254 = _1158 * _1212;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1256;
    float _1260 = _1192 * _1252;
    float _1262 = -_1192;
    float _1264 = _1262 + 1.0;
    float _1266 = fma(_1258, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = _1162 * _1230;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = fma(_1272, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1280 = fma(_1276, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1282 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_1150);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _1226 * _1264;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1308 = _1292 * _1248;
    float _1310 = -_1292;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1302, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1316 = fma(_1298, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1318 = fma(_1306, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1320 = _1204 * _1312;
    float _1322 = _1278 * _1320;
    float _1324 = _1266 * _1320;
    float _1326 = -_1204;
    float _1328 = _1326 + 1.0;
    float _1330 = _1280 * _1320;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1340;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1324);
    float _1346 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1322);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1330);
    float _1350 = fma(_1334, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1352 = fma(_1338, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1354 = fma(_1342, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1356 = fma(_1314, _1308, _1344);
    float _1358 = fma(_1316, _1308, _1346);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1368 = fma(_1318, _1308, _1348);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1374 = fma(_1350, _1294, _1356);
    float _1376 = fma(_1362, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1378 = fma(_1366, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1380 = fma(_1352, _1294, _1358);
    float _1382 = fma(_1372, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1384 = fma(_1354, _1294, _1368);
    float _1386 = fma(_1376, _1260, _1374);
    float _1388 = fma(_1378, _1260, _1380);
    float _1390 = fma(_1382, _1260, _1384);
    float _1392 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1386);
    float _1394 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1388);
    float _1396 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1390);
    bool _1398 = !_1228;
    float _1416;
    if (!_1398)
    {
        float _1400 = in.m_51.x;
        float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1404 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _1408 = _1406 * _1402;
        float _1410 = floor(_1408);
        float _1412 = -_1410;
        float _1414 = _1408 + _1412;
        _1416 = _1414;
        _1418 = true;
    }
    else
    {
        float _1420 = float(_90);
        float _1422 = 1.0 / _1420;
        float _1424 = _124 * _1422;
        _1416 = _1424;
    }
    _1418 = false;
    float _1426 = _1416;
    float _1428 = in.m_51.z;
    float _1430 = _934 * _934;
    float _1432 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1434 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1436 = in.m_51.x;
    float _1438 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1440 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = in.m_51.y;
    float _1448 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1432);
    float _1450 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1434);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    float _1464 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1438);
    float _1466 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1440);
    float _1468 = _604 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _606 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1476 = _608 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1478 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1448);
    int _1480 = abs(_1472);
    float _1482 = _1444 * _124;
    float _1484 = _1428 * 2.0;
    float _1486 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1450);
    float _1490 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1464);
    float _1492 = _1436 * 2.0;
    float _1494 = floor(_1484);
    float _1496 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1466);
    float _1498 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1500 = _1446 * 2.0;
    float _1502 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1504 = _1490 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1508 = floor(_1492);
    float _1510 = fma(_936, _936, _1430);
    float _1512 = _272 * _1502;
    float _1514 = _480 * _1504;
    float _1516 = fma(_938, _938, _1510);
    float _1518 = _1436 + _1446;
    float _1520 = floor(_1500);
    float _1522 = _1446 + _1428;
    bool _1524 = _1494 > 0.0;
    float _1526 = _1518 + (-1.0);
    bool _1528 = _1494 >= 0.0;
    bool _1530 = isnan(_1494);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = _1522 + (-1.0);
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1542 = _1508 > 0.0;
    float _1544 = rsqrt(_1516);
    bool _1546 = _1508 >= 0.0;
    bool _1548 = isnan(_1508);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1558 = _1536 ? 0 : 1;
    int _1560 = _1554 ? 0 : 1;
    int _1562 = ~_1558;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1482);
    int _1570 = ~_1560;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = _1566;
    int _1578 = _1574;
    float _1580 = _1506;
    if (!_1524)
    {
        int _1582 = ~_1558;
        int _1584 = _1582 + 1;
        _1576 = _1584;
    }
    int _1586 = _1576;
    if (!_1542)
    {
        int _1588 = ~_1560;
        int _1590 = _1588 + 1;
        _1578 = _1590;
    }
    int _1592 = _1578;
    float _1594 = in.m_53.x;
    float _1596 = in.m_53.y;
    float _1598 = in.m_53.z;
    float _1600 = _1544 * _934;
    bool _1602 = _1520 > 0.0;
    float _1604 = _1544 * _936;
    bool _1606 = _1520 >= 0.0;
    bool _1608 = isnan(_1520);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1618 = 1.0 + _1616;
    bool _1620 = !_1454;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _612 * _1600;
    float _1626 = float(_1586);
    float _1628 = 1.0 / _1618;
    int _1630 = abs(_1622);
    float _1632 = _1544 * _938;
    float _1634 = fma(_610, _1604, _1624);
    bool _1636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1638 = isnan(1.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1644 = _1640 || _1642;
    float _1646 = -_1568;
    float _1648 = _1646 + 1.0;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    int _1660 = _1614 ? 0 : 1;
    float _1662 = float(_1630);
    float _1664 = float(_1480);
    float _1666 = _1658 ? _1648 : 0.0;
    float _1668 = _1662 * _1626;
    float _1670 = fma(_614, _1632, _1634);
    int _1672 = ~_1660;
    int _1674 = _1672 + 1;
    int _1676 = _1674 + 1;
    float _1678 = _1668 * (-2.0);
    int _1680 = _1676;
    float _1682 = _1604;
    if (!_1602)
    {
        int _1684 = ~_1660;
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    if (_1644)
    {
        float _1690 = _1666 * _1628;
        _128 = _1690;
    }
    float _1692 = _128;
    float _1694 = abs(_1670);
    bool _1696 = _1694 > 0.99989998340606689453125;
    float _1698 = _1436 + (-0.5);
    float _1700 = fma(_1678, _1594, _1594);
    bool _1702 = !_1462;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = fma(_1540, _1678, _1540);
    float _1708 = float(_1592);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1700);
    int _1712 = abs(_1704);
    float _1714 = _1436 + _1428;
    float _1716 = _1428 + (-0.5);
    float _1718 = fma(_1706, _1692, _1710);
    float _1720 = float(_1712);
    float _1722 = _1664 * _1708;
    float _1724 = float(_1688);
    float _1726 = _1714 + (-1.0);
    float _1728 = in.m_55.x;
    float _1730 = in.m_55.y;
    float _1732 = in.m_55.z;
    float _1734 = _1722 * (-2.0);
    if (_1696)
    {
        float _1736 = fma(_1468, 0.001000000047497451305389404296875, _610);
        _622 = _1736;
    }
    float _1738 = _622;
    float _1740 = _1720 * _1724;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1744 = fma(_1556, _1734, _1556);
    float _1746 = fma(_1734, _1596, _1596);
    float _1748 = _1740 * (-2.0);
    float _1750 = _1446 + (-0.5);
    if (_1696)
    {
        float _1752 = fma(_1474, 0.001000000047497451305389404296875, _612);
        _624 = _1752;
    }
    float _1754 = _624;
    if (_1696)
    {
        float _1756 = fma(_1476, 0.001000000047497451305389404296875, _614);
        _626 = _1756;
    }
    float _1758 = _626;
    float _1760 = fma(_1742, _1748, _1742);
    float _1762 = fma(_1748, _1598, _1598);
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1746);
    float _1766 = -_1738;
    float _1768 = _1632 * _1766;
    float _1770 = -_1758;
    float _1772 = _1600 * _1770;
    float _1774 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1762);
    float _1776 = fma(_1744, _1692, _1764);
    float _1778 = _1718 * 0.15915493667125701904296875;
    float _1780 = fma(_1760, _1692, _1774);
    float _1782 = -_1758;
    float _1784 = -_1768;
    float _1786 = fma(_1604, _1782, _1784);
    float _1788 = -_1754;
    float _1790 = -_1772;
    float _1792 = fma(_1632, _1788, _1790);
    float _1794 = _1776 * 0.15915493667125701904296875;
    float _1796 = _1780 * 0.15915493667125701904296875;
    float _1798 = -_1754;
    float _1800 = _1604 * _1798;
    float _1802 = _1786 * _1786;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1728);
    float _1806 = _1778 * 6.283185482025146484375;
    float _1808 = sin(_1806);
    float _1810 = -_1738;
    float _1812 = -_1800;
    float _1814 = fma(_1600, _1810, _1812);
    float _1816 = fma(_1792, _1792, _1802);
    float _1818 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1730);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1732);
    float _1824 = fma(_1814, _1814, _1816);
    float _1826 = _1478 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1828 = _1778 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _1818 * _1804;
    float _1834 = _1486 * _1820;
    float _1836 = _174 * _1826;
    float _1838 = _1498 * _1822;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1848 = _1844 || _1846;
    float _1850 = _1794 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1794 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1796 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1808 * _1852;
    float _1864 = _1830 * _1852;
    float _1866 = _1796 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    float _1870 = _1830 * _1856;
    float _1872 = _1808 * _1856;
    float _1874 = rsqrt(_1824);
    float _1876 = _1808 * _1860;
    float _1878 = _1856 * _1860;
    float _1880 = _1830 * _1860;
    float _1882 = _1852 * _1860;
    float _1884 = fma(_1868, _1870, _1862);
    float _1886 = fma(_1868, _1862, _1870);
    float _1888 = -_1864;
    float _1890 = fma(_1868, _1872, _1888);
    float _1892 = -_1872;
    float _1894 = fma(_1868, _1864, _1892);
    float _1896 = _1884 * _1604;
    float _1898 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1894 * _1604;
    float _1902 = _1814 * _1874;
    float _1904 = _1792 * _1874;
    float _1906 = _1880 * _1604;
    float _1908 = _1786 * _1874;
    float _1910 = _1600 * _1902;
    float _1912 = fma(_1878, _1904, _1896);
    float _1914 = -_1868;
    float _1916 = fma(_1914, _1904, _1906);
    float _1918 = fma(_1882, _1904, _1900);
    float _1920 = -_1910;
    float _1922 = fma(_1632, _1908, _1920);
    float _1924 = _1894 * _1632;
    float _1926 = _1894 * _1600;
    float _1928 = fma(_1890, _1922, _1912);
    float _1930 = fma(_1876, _1922, _1916);
    float _1932 = fma(_1886, _1922, _1918);
    float _1934 = _1880 * _1632;
    float _1936 = _1604 * _1908;
    float _1938 = _1884 * _1632;
    float _1940 = _1834 * _1930;
    float _1942 = -_1868;
    float _1944 = fma(_1942, _1902, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1600, _1904, _1946);
    float _1950 = fma(_1878, _1902, _1938);
    float _1952 = fma(_1882, _1902, _1924);
    float _1954 = fma(_1832, _1928, _1940);
    float _1956 = fma(_1876, _1948, _1944);
    float _1958 = fma(_1890, _1948, _1950);
    float _1960 = fma(_1886, _1948, _1952);
    float _1962 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1964 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1966 = _1834 * _1956;
    float _1968 = fma(_1838, _1932, _1954);
    float _1970 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1962);
    float _1972 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _1974 = fma(_1832, _1958, _1966);
    float _1976 = _1632 * _1904;
    float _1978 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1970);
    float _1980 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1972);
    float _1982 = fma(_1838, _1960, _1974);
    float _1984 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1986 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1990 = _1884 * _1600;
    float _1992 = -_1976;
    float _1994 = fma(_1604, _1902, _1992);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1998 = _1988 + _1982;
    float _2000 = _1880 * _1600;
    float _2002 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1984);
    float _2004 = _1996 + _1968;
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2008 = _1998 + _2006;
    float _2010 = -_1868;
    float _2012 = fma(_2010, _1908, _2000);
    float _2014 = fma(_1878, _1908, _1990);
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2018 = _2004 + _2016;
    float _2020 = _2008 * _2008;
    float _2022 = fma(_1876, _1994, _2012);
    float _2024 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2026 = fma(_1882, _1908, _1926);
    float _2028 = fma(_2018, _2018, _2020);
    float _2030 = fma(_1890, _1994, _2014);
    float _2032 = _1834 * _2022;
    float _2034 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2024);
    float _2036 = sqrt(_2028);
    float _2038 = fma(_1886, _1994, _2026);
    float _2040 = fma(_1832, _2030, _2032);
    float _2042 = _2034 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2044 = fma(_1838, _2038, _2040);
    float _2046 = _2042 + _2044;
    bool _2048 = _2036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = _2040;
    float _2052 = _2032;
    float _2054 = _2034;
    float _2056 = _1994;
    float _2058 = 0.5;
    if (!_2048)
    {
        _2050 = _2004;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (!_2048)
    {
        _2052 = _1998;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_2048)
    {
        _2054 = _2046;
    }
    float _2068 = _2054;
    bool _2070 = !_2048;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2036 + _2076;
        float _2080 = rsqrt(_2028);
        float _2082 = _2078 * _2074;
        float _2084 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = _2082 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        float _2096 = fma(_2090, _2084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2098 = _2080 * _2096;
        float _2100 = _2094 + (-1.0);
        float _2102 = fma(_2018, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2104 = fma(_2008, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2108 = fma(_2046, _2094, _2106);
        _2062 = _2102;
        _2072 = _2108;
        _2066 = _2104;
    }
    float _2110 = _2062;
    float _2112 = _2072;
    float _2114 = _2066;
    float _2116 = _2112;
    float _2118 = _2110;
    float _2120 = _2114;
    if (!_1848)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _2042 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1996 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2132 = -_1996;
        float _2134 = _2132 + _2110;
        float _2136 = _2124 * _2124;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2140 = _1988 + _2138;
        float _2142 = -_2042;
        float _2144 = _2142 + _2112;
        float _2146 = fma(_2128, _2128, _2136);
        float _2148 = fma(_2140, _2140, _2146);
        float _2150 = sqrt(_2148);
        float _2152 = precise::min(_2150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2154 = _2152 * _2130;
        float _2156 = -_1988;
        float _2158 = _2156 + _2114;
        float _2160 = fma(_2134, _2154, _1996);
        float _2162 = fma(_2144, _2154, _2042);
        float _2164 = fma(_2158, _2154, _1988);
        _2116 = _2162;
        _2118 = _2160;
        _2120 = _2164;
    }
    float _2166 = _2116;
    float _2168 = _2118;
    float _2170 = _2120;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2166 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2168 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2170 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2186;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    if (_2208)
    {
        float _2222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2222;
    }
    float _2224 = _2214;
    if (_2208)
    {
        float _2226 = rsqrt(_2204);
        _2216 = _2226;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    if (_2208)
    {
        float _2232 = _2212 * _2224;
        _2218 = _2232;
    }
    float _2234 = _2218;
    if (_2208)
    {
        float _2236 = _2234 * 0.15915493667125701904296875;
        _2056 = _2236;
    }
    float _2238 = _2056;
    float _2240 = _2182;
    float _2242 = _2238;
    if (_2208)
    {
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = precise::max(0.0, _2250);
    float _2254 = _2224;
    float _2256 = _2252;
    if (_2208)
    {
        float _2258 = _2238 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2254 = _2260;
    }
    float _2262 = _2254;
    float _2264 = -_2194;
    float _2266 = -_2252;
    float _2268 = fma(_2174, _2264, _2266);
    if (_2208)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2270;
    }
    float _2272 = _2220;
    float _2274 = _2272;
    float _2276 = _2248;
    if (_2208)
    {
        float _2278 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _2280;
    if (!_2208)
    {
        _2276 = _2196;
    }
    float _2284 = _2276;
    float _2286 = _2284;
    float _2288 = _2262;
    if (_2208)
    {
        float _2290 = _2262 + (-1.0);
        _2256 = _2290;
    }
    float _2292 = _2256;
    float _2294 = _2292;
    if (_2208)
    {
        float _2296 = _2228 * _2280;
        _1682 = _2296;
    }
    float _2298 = _1682;
    if (!_2208)
    {
        _2282 = _2268;
    }
    float _2300 = _2282;
    float _2302 = _2300;
    if (_2208)
    {
        float _2304 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2304;
    }
    float _2306 = _2242;
    if (_2208)
    {
        float _2308 = _2196 * _2298;
        _2286 = _2308;
    }
    float _2310 = _2286;
    if (!_2208)
    {
        _2294 = _2198;
    }
    float _2312 = _2294;
    float _2314 = _2312;
    if (_2208)
    {
        float _2316 = _2198 * _2298;
        _2314 = _2316;
    }
    float _2318 = _2314;
    if (!_2208)
    {
        _2230 = _2200;
    }
    float _2320 = _2230;
    float _2322 = _2320;
    if (_2208)
    {
        float _2324 = fma(_2268, _2262, _2306);
        _2302 = _2324;
    }
    float _2326 = _2302;
    if (_2208)
    {
        float _2328 = _2310 * _2310;
        _2322 = _2328;
    }
    float _2330 = _2322;
    if (!_2208)
    {
        _2288 = _2202;
    }
    float _2332 = _2288;
    float _2334 = _2332;
    if (_2208)
    {
        float _2336 = _2318 * _2318;
        _2334 = _2336;
    }
    float _2338 = _2334;
    float _2340 = fma(_2326, _2326, _2330);
    float _2342 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2344 = _2340 + _2338;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2342);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2350 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2348);
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2358 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2346);
    float _2360 = rsqrt(_2344);
    float _2362 = -_2352;
    float _2364 = _2362 + 1.0;
    float _2366 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2370 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2376 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2368);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2370);
    float _2380 = abs(_2364);
    float _2382 = log2(_2380);
    float _2384 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2374);
    float _2386 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2388 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2378);
    float _2390 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2396 = _2360 * _2310;
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = _2360 * _2326;
    float _2402 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2394);
    float _2404 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = _2360 * _2318;
    float _2408 = -_2390;
    float _2410 = fma(_2408, _2356, 1.0);
    float _2412 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2402);
    float _2414 = -_2404;
    float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2414);
    float _2418 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2420 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2412);
    float _2422 = -_2406;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2416);
    float _2426 = exp2(_2418);
    float _2428 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2432 = fma(_2424, -0.5, 0.5);
    float _2434 = fma(_2424, 0.5, 0.5);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2428);
    float _2438 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2430);
    float _2440 = _2400 + 1.0;
    float _2442 = log2(_2410);
    float _2444 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2436);
    float _2446 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = fma(_2434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2450 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2444);
    float _2452 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float _2454 = fma(_2434, _2448, -0.212114393711090087890625);
    float _2456 = 1.0 / _2420;
    float _2458 = -_2400;
    float _2460 = fma(_2426, _2440, _2458);
    float _2462 = fma(_2434, _2454, 1.570728778839111328125);
    float _2464 = sqrt(_2432);
    float _2466 = _2442 * 0.693147182464599609375;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2450 * _2456;
    float _2472 = _2452 * _2456;
    float _2474 = fma(_2470, 0.5, 0.5);
    float _2476 = fma(_2472, -0.5, 0.5);
    float _2478 = fma(_2460, 0.5, 0.5);
    float _2480 = _2464 * 0.636619746685028076171875;
    float3 _6849 = float3(_2474, _2476, _2468);
    float _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6849, float3(0.0), isnan(_6849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6849, float3(0.0), isnan(_6849)), level(0.0)).x;
    float _2484 = -_2462;
    float _2486 = fma(_2480, _2484, 1.0);
    float3 _6865 = float3(_2474, _2476, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6865, float3(0.0), isnan(_6865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6865, float3(0.0), isnan(_6865)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6882 = float2(_2486, _2478);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6882, float2(0.0), isnan(_6882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6882, float2(0.0), isnan(_6882)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = in.m_57.y;
    float _2511 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2513 = in.m_57.x;
    bool _2515 = _1446 > 0.5;
    float _2517 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2525 = _2523 != 0;
    float _2527 = in.m_59.x;
    float _2529 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2517);
    float _2531 = 1.0 / _2521;
    float _2533 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2537 = _2535 != 0;
    float _2539 = _2529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2541 = _1436 > 0.5;
    bool _2543 = _2541 && _2525;
    float _2545 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2533);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2549 = _1426 + _2547;
    float _2551 = 1.0 / _2539;
    bool _2553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2565;
    float _2569 = in.m_59.y;
    float _2571 = -_2509;
    float _2573 = _2571 + 1.0;
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2577 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2579 = _2567 * _2531;
    float _2581 = _2509;
    float _2583 = _2579;
    float _2585 = _2513;
    if (_2525)
    {
        _2058 = _2513;
    }
    float _2587 = _2058;
    float _2589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2591 = _2587;
    if (_2537)
    {
        float _2593 = _2515 ? _2573 : _2509;
        _2581 = _2593;
    }
    float _2595 = _2581;
    float _2597 = _2575 + _2539;
    float _2599 = fma(_2579, _2549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (!_2525)
    {
        _2583 = _2513;
    }
    float _2601 = _2583;
    out.m_61.x = _2527;
    float _2603 = _2527;
    float _2605 = _2601;
    if (!_2561)
    {
        _2585 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2607 = _2585;
    float _2609 = _2597 * _2551;
    float _2611 = _2609 * 0.5;
    float _2613 = _2607;
    if (!_2561)
    {
        _1580 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2615 = _1580;
    float _2617 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2543)
    {
        float _2619 = -_2587;
        float _2621 = _2619 + 1.0;
        _2591 = _2621;
    }
    float _2623 = _2591;
    if (!_2561)
    {
        float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2627 = fma(_2611, _2607, _2625);
        _2613 = _2627;
    }
    float _2629 = _2613;
    float _2631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2561)
    {
        float _2633 = -_2615;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2635;
    }
    float _2637 = _2603;
    bool _2639 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2641 = isnan(_1426);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2647 = _2643 || _2645;
    float _2649 = float(_2647);
    float _2651 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2653 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2655 = isnan(_1426);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = _2617 * _2589;
    float _2667 = -_2649;
    float _2669 = _2667 + 1.0;
    float _2671 = _2629;
    if (!_2561)
    {
        float _2673 = 1.0 / _2629;
        _2671 = _2673;
    }
    float _2675 = _2671;
    out.m_61.y = _2569;
    if (_2525)
    {
        _2605 = _2623;
    }
    float _2677 = _2605;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2681 = _2663 * _2669;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2685 = -_2663;
    float _2687 = _2685 + 1.0;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2691 = _2687;
    if (!_2561)
    {
        float _2693 = 1.0 / _2637;
        _2689 = _2693;
    }
    float _2695 = _2689;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = _2599 * _2681;
    float _2705 = _2697 * _2631;
    float _2707 = in.m_59.z;
    float _2709 = _2697;
    if (!_2561)
    {
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2713 = -_2615;
        float _2715 = fma(_2675, _2711, _2713);
        _2709 = _2715;
    }
    float _2717 = _2709;
    float _2719 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2703);
    if (_2561)
    {
        _2691 = 1.0;
    }
    float _2721 = _2691;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2725 = in.m_59.w;
    float _2727 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2721;
    if (!_2561)
    {
        float _2733 = _2717 * _2695;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2731 = _2735;
    }
    float _2737 = _2731;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2741 = exp2(_2577);
    float _2743 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2719);
    float _2745 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    bool _2747 = _2737 > 0.0;
    bool _2749 = isnan(_2737);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    out.m_63.x = _2729;
    out.m_63.y = _2699;
    out.m_63.z = _2701;
    out.m_63.w = _2739;
    float _2757 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2745);
    out.m_65.x = _2705;
    out.m_65.y = _2665;
    float _2759 = _2450 + _2420;
    float _2761 = _2757 + _2420;
    out.gl_Position.x = _2450;
    out.gl_Position.y = _2452;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2420;
    float _2763 = _2759 * 0.5;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2741;
    float _2769 = _2767 + 1.0;
    out.m_61.z = _2707;
    float _2771 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2773 = _2420 * 0.5;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2777 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2779 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2781 = fma(_2452, -0.5, _2773);
    float _2783 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.w = _2725;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    out.m_69.x = _2763;
    out.m_69.y = _2781;
    out.m_69.z = _2765;
    out.m_69.w = _2420;
    out.m_45.x = _2793;
    float _2795 = _2775 * _2482;
    float _2797 = -_2775;
    float _2799 = _2797 + 1.0;
    float _2801 = _2497 * _2795;
    float _2803 = _2497 * _2799;
    float _2805 = _2507 * _2795;
    float _2807 = fma(_2503, _2801, _2491);
    float _2809 = fma(_2505, _2801, _2493);
    float _2811 = fma(_2497, _2805, _2495);
    out.m_71.x = _2807;
    out.m_71.y = _2809;
    out.m_71.z = _2811;
    out.m_71.w = _2803;
    if (_2755)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1418 = false;
    bool _1142 = false;
    bool _962 = false;
    bool _710 = false;
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
        float _2870 = as_type<float>(_106);
        out.gl_Position.z = _2870;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2939 = as_type<float>(_144);
        out.gl_Position.z = _2939;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _150 = (*spvDescriptorSet0.vp_c10)._m0[15].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _152 = fma((*spvDescriptorSet0.vp_c10)._m0[15].x, (*spvDescriptorSet0.vp_c10)._m0[15].x, _150);
    float _154 = (*spvDescriptorSet0.vp_c10)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[16].y;
    float _156 = fma((*spvDescriptorSet0.vp_c10)._m0[15].z, (*spvDescriptorSet0.vp_c10)._m0[15].z, _152);
    float _158 = fma((*spvDescriptorSet0.vp_c10)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[16].x, _154);
    float _160 = sqrt(_156);
    float _162 = fma((*spvDescriptorSet0.vp_c10)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _158);
    float _164 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _166 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _164);
    float _168 = sqrt(_162);
    float _170 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _166);
    bool _172 = _160 > 0.0;
    float _174 = sqrt(_170);
    bool _176 = _168 > 0.0;
    float _178 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _180 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _182 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _178);
    float _184 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _180);
    float _186 = 0.0;
    float _188 = (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _190 = _156;
    float _192 = _162;
    if (_172)
    {
        float _194 = rsqrt(_156);
        _186 = _194;
    }
    float _196 = _186;
    bool _198 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _200 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _202 = _198 || _200;
    bool _204 = isnan(1.0);
    bool _206 = _202 || _204;
    float _208 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _182);
    float _210 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _184);
    float _212 = in.m_47.x;
    float _214 = in.m_47.y;
    float _216 = in.m_47.z;
    float _218 = 0.0;
    if (!_172)
    {
        _218 = 0.0;
    }
    float _220 = _218;
    float _222 = 0.0;
    float _224 = _220;
    if (!_172)
    {
        _222 = 0.0;
    }
    float _226 = _222;
    float _228 = in.m_42.x;
    float _230 = in.m_42.y;
    float _232 = in.m_42.z;
    float _234 = 0.0;
    float _236 = _226;
    if (_176)
    {
        float _238 = rsqrt(_162);
        _234 = _238;
    }
    float _240 = _234;
    if (!_172)
    {
        _188 = 0.0;
    }
    float _242 = _188;
    float _244 = _242;
    if (!_176)
    {
        _190 = 0.0;
    }
    float _246 = _190;
    float _248 = 0.0;
    float _250 = _246;
    if (!_206)
    {
        float _252 = _148 * _148;
        float _254 = _252 * 0.5;
        _248 = _254;
    }
    float _256 = _248;
    float _258 = 0.0;
    float _260 = _256;
    if (!_176)
    {
        _258 = 0.0;
    }
    float _262 = _258;
    float _264 = _196;
    float _266 = _262;
    if (_172)
    {
        float _268 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
        _224 = _268;
    }
    float _270 = _224;
    float _272 = sqrt(_208);
    if (!_176)
    {
        _192 = 0.0;
    }
    float _274 = _192;
    float _276 = _274;
    if (_172)
    {
        float _278 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
        _236 = _278;
    }
    float _280 = _236;
    if (_172)
    {
        float _282 = _196 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
        _244 = _282;
    }
    float _284 = _244;
    if (!_206)
    {
        _264 = _148;
    }
    float _286 = _264;
    float _288 = _286;
    if (!_206)
    {
        float _290 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _260 = _290;
    }
    float _292 = _260;
    float _294 = _292;
    if (_176)
    {
        float _296 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].x;
        _250 = _296;
    }
    float _298 = _250;
    if (_176)
    {
        float _300 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].y;
        _266 = _300;
    }
    float _302 = _266;
    if (_176)
    {
        float _304 = _240 * (*spvDescriptorSet0.vp_c10)._m0[16].z;
        _276 = _304;
    }
    float _306 = _276;
    bool _308 = !_206;
    if (!_308)
    {
        float _310 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _312 = log2(_310);
        float _314 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _316 = _314 + 1.0;
        float _318 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = _148 * _312;
        float _322 = 1.0 / _316;
        float _324 = _318 * 0.693147182464599609375;
        float _326 = exp2(_320);
        float _328 = 1.0 / _324;
        float _330 = _326 + (-1.0);
        float _332 = -_330;
        float _334 = fma(_332, _328, _148);
        float _336 = _334 * _322;
        float _338 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _294 = _338;
    }
    float _340 = _294;
    bool _342 = !_206;
    if (!_342)
    {
        float _344 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = log2(_344);
        float _348 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _350 = _348 + 1.0;
        float _352 = 1.0 / _350;
        float _354 = _148 * _346;
        float _356 = exp2(_354);
        float _358 = -_356;
        float _360 = _358 + 1.0;
        float _362 = _360 * _352;
        _288 = _362;
    }
    float _364 = _288;
    float _366 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _272 * _280;
    float _370 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _374 = fma(_364, _212, _366);
    float _376 = _174 * _270;
    float _378 = _368 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _380 = _368 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _382 = _368 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _384 = 0.0;
    float _386 = _372;
    float _388 = _376;
    if (!_206)
    {
        float _390 = _124 * _124;
        float _392 = _390 * 0.5;
        _384 = _392;
    }
    float _394 = _384;
    float _396 = fma(_364, _214, _370);
    float _398 = fma(_364, _216, _372);
    float _400 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _378);
    float _402 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[25].x, _380);
    float _404 = fma(_376, (*spvDescriptorSet0.vp_c8)._m0[26].x, _382);
    if (!_206)
    {
        _386 = _124;
    }
    float _406 = _386;
    float _408 = _406;
    if (!_206)
    {
        float _410 = _394 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _388 = _410;
    }
    float _412 = _388;
    bool _414 = !_206;
    float _416 = _412;
    if (!_414)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _428 = _124 * _420;
        float _430 = 1.0 / _424;
        float _432 = _426 * 0.693147182464599609375;
        float _434 = exp2(_428);
        float _436 = 1.0 / _432;
        float _438 = _434 + (-1.0);
        float _440 = -_438;
        float _442 = fma(_440, _436, _124);
        float _444 = _442 * _430;
        float _446 = _444 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _416 = _446;
    }
    float _448 = _416;
    bool _450 = !_206;
    if (!_450)
    {
        float _452 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _454 = log2(_452);
        float _456 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _458 = _456 + 1.0;
        float _460 = 1.0 / _458;
        float _462 = _124 * _454;
        float _464 = exp2(_462);
        float _466 = -_464;
        float _468 = _466 + 1.0;
        float _470 = _468 * _460;
        _408 = _470;
    }
    float _472 = _408;
    float _474 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _476 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _478 = _448 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _480 = sqrt(_210);
    float _482 = fma(_472, _214, _474);
    float _484 = fma(_472, _212, _476);
    float _486 = fma(_472, _216, _478);
    float _488 = _272 * _302;
    float _490 = -_482;
    float _492 = _396 + _490;
    float _494 = -_484;
    float _496 = _374 + _494;
    float _498 = _174 * _298;
    float _500 = _488 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _502 = _492 * _492;
    float _504 = _488 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _506 = _488 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _508 = -_486;
    float _510 = _398 + _508;
    float _512 = fma(_496, _496, _502);
    float _514 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _500);
    float _516 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[25].x, _504);
    float _518 = fma(_498, (*spvDescriptorSet0.vp_c8)._m0[26].x, _506);
    float _520 = _480 * _284;
    float _522 = fma(_510, _510, _512);
    float _524 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _526 = fma(_374, _146, _228);
    float _528 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[25].z, _402);
    float _530 = sqrt(_522);
    float _532 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[24].z, _400);
    float _534 = fma(_520, (*spvDescriptorSet0.vp_c8)._m0[26].z, _404);
    float _536 = fma(_396, _146, _230);
    float _538 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _540 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].y, _524);
    float _542 = fma(_398, _146, _232);
    float _544 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _546 = _492 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _548 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].x, _538);
    float _550 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].y, _540);
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].z, _544);
    float _554 = fma(_496, (*spvDescriptorSet0.vp_c10)._m0[14].w, _546);
    float _556 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].x, _548);
    float _558 = _272 * _550;
    float _560 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].z, _552);
    float _562 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[16].w, _554);
    float _564 = _174 * _556;
    float _566 = _558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = _558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _570 = _530 >= 9.9999999747524270787835121154785e-07;
    bool _572 = isnan(_530);
    bool _574 = _570 || _572;
    bool _576 = isnan(9.9999999747524270787835121154785e-07);
    bool _578 = _574 || _576;
    float _580 = _558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _582 = _480 * _560;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _586 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].x, _568);
    float _588 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _580);
    float _590 = _480 * _306;
    float _592 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[24].z, _584);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[25].z, _586);
    float _596 = fma(_582, (*spvDescriptorSet0.vp_c8)._m0[26].z, _588);
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[24].w, _592);
    float _600 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[25].w, _594);
    float _602 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[26].w, _596);
    float _604 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[24].z, _514);
    float _606 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[25].z, _516);
    float _608 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    float _610 = _532 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _612 = _528 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _614 = _534 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _616 = _596;
    float _618 = _562;
    float _620 = _602;
    float _622 = _610;
    float _624 = _612;
    float _626 = _614;
    if (_578)
    {
        _616 = _598;
    }
    float _628 = _616;
    float _630 = _628;
    if (_578)
    {
        _618 = _600;
    }
    float _632 = _618;
    float _634 = _632;
    if (!_578)
    {
        bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _638 = !_636;
        if (!_638)
        {
            float _640 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _642 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _644 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _646 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _640);
            float _648 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _642);
            float _650 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _644);
            float _652 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _646);
            float _654 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _648);
            float _656 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _658 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _650);
            float _660 = _272 * _652;
            float _662 = _174 * _654;
            float _664 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _656);
            float _666 = _480 * _658;
            float _668 = _660 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _670 = _660 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _672 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _664);
            float _674 = _660 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _676 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _668);
            float _678 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _670);
            float _680 = fma(_662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _674);
            float _682 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _676);
            float _684 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _678);
            float _686 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _680);
            float _688 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[25].w, _682);
            float _690 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[24].w, _684);
            float _692 = fma(_672, (*spvDescriptorSet0.vp_c8)._m0[26].w, _686);
            float _694 = _688 * _688;
            float _696 = fma(_690, _690, _694);
            float _698 = fma(_692, _692, _696);
            float _700 = rsqrt(_698);
            float _702 = _700 * 9.9999999747524270787835121154785e-07;
            float _704 = _690 * _702;
            float _706 = _688 * _702;
            float _708 = _692 * _702;
            _634 = _706;
            _630 = _704;
            _620 = _708;
            _710 = true;
        }
        else
        {
            float _712 = _214 * _214;
            float _714 = fma(_212, _212, _712);
            float _716 = fma(_216, _216, _714);
            float _718 = sqrt(_716);
            bool _720 = _718 >= 9.9999999747524270787835121154785e-07;
            bool _722 = isnan(_718);
            bool _724 = _720 || _722;
            bool _726 = isnan(9.9999999747524270787835121154785e-07);
            bool _728 = _724 || _726;
            if (!_728)
            {
                float _730 = _230 * _230;
                float _732 = fma(_228, _228, _730);
                float _734 = fma(_232, _232, _732);
                float _736 = sqrt(_734);
                bool _738 = _736 >= 9.9999999747524270787835121154785e-07;
                bool _740 = isnan(_736);
                bool _742 = _738 || _740;
                bool _744 = isnan(9.9999999747524270787835121154785e-07);
                bool _746 = _742 || _744;
                if (!_746)
                {
                    float _748 = _272 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _750 = _174 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _752 = _480 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _754 = _748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _756 = _748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _758 = _748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _760 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _754);
                    float _762 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _756);
                    float _764 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _758);
                    float _766 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
                    float _768 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].z, _762);
                    float _770 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].z, _764);
                    float _772 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _766);
                    float _774 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _768);
                    float _776 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _770);
                    float _778 = _772 * _772;
                    float _780 = fma(_774, _774, _778);
                    float _782 = fma(_776, _776, _780);
                    float _784 = rsqrt(_782);
                    float _786 = _784 * 9.9999999747524270787835121154785e-07;
                    float _788 = _774 * _786;
                    float _790 = _772 * _786;
                    float _792 = _776 * _786;
                    _634 = _790;
                    _630 = _788;
                    _620 = _792;
                    _710 = true;
                }
                else
                {
                    float _794 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _796 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _798 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _800 = _230 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _802 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].y, _794);
                    float _804 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].x, _796);
                    float _806 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].z, _798);
                    float _808 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[14].w, _800);
                    float _810 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].y, _802);
                    float _812 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].x, _804);
                    float _814 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].w, _808);
                    float _816 = _272 * _810;
                    float _818 = fma(_232, (*spvDescriptorSet0.vp_c10)._m0[16].z, _806);
                    float _820 = _174 * _812;
                    float _822 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _826 = _480 * _818;
                    float _828 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _830 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _822);
                    float _832 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
                    float _834 = fma(_820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _828);
                    float _836 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[25].z, _830);
                    float _838 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
                    float _840 = fma(_826, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
                    float _842 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].w, _836);
                    float _844 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].w, _838);
                    float _846 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].w, _840);
                    float _848 = _842 * _842;
                    float _850 = fma(_844, _844, _848);
                    float _852 = fma(_846, _846, _850);
                    float _854 = rsqrt(_852);
                    float _856 = _854 * 9.9999999747524270787835121154785e-07;
                    float _858 = _844 * _856;
                    float _860 = _842 * _856;
                    float _862 = _846 * _856;
                    _634 = _860;
                    _630 = _858;
                    _620 = _862;
                    _710 = true;
                }
            }
            else
            {
                float _864 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _866 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _868 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _870 = _214 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _872 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].y, _864);
                float _874 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].x, _866);
                float _876 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].z, _868);
                float _878 = fma(_212, (*spvDescriptorSet0.vp_c10)._m0[14].w, _870);
                float _880 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].y, _872);
                float _882 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].x, _874);
                float _884 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].w, _878);
                float _886 = _272 * _880;
                float _888 = fma(_216, (*spvDescriptorSet0.vp_c10)._m0[16].z, _876);
                float _890 = _174 * _882;
                float _892 = _886 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _894 = _480 * _888;
                float _896 = _886 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _898 = _886 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _900 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _892);
                float _902 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _896);
                float _904 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _898);
                float _906 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _900);
                float _908 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _902);
                float _910 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _904);
                float _912 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[25].w, _906);
                float _914 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[24].w, _908);
                float _916 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[26].w, _910);
                float _918 = _912 * _912;
                float _920 = fma(_914, _914, _918);
                float _922 = fma(_916, _916, _920);
                float _924 = rsqrt(_922);
                float _926 = _924 * 9.9999999747524270787835121154785e-07;
                float _928 = _914 * _926;
                float _930 = _912 * _926;
                float _932 = _916 * _926;
                _634 = _930;
                _630 = _928;
                _620 = _932;
            }
        }
    }
    _710 = false;
    float _934 = _634;
    float _936 = _630;
    float _938 = _620;
    bool _940 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _942 = !_940;
    float _960;
    if (!_942)
    {
        float _944 = in.m_51.x;
        float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _948 = _944 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _950 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _952 = _950 * _946;
        float _954 = floor(_952);
        float _956 = -_954;
        float _958 = _952 + _956;
        _960 = _958;
        _962 = true;
    }
    else
    {
        float _964 = float(_90);
        float _966 = 1.0 / _964;
        float _968 = _124 * _966;
        _960 = _968;
    }
    _962 = false;
    float _970 = _960;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _974 = _970 + _972;
    bool _976 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _978 = isnan(_970);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _990 = _970 + _988;
    bool _992 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _994 = isnan(_970);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1000 = _996 || _998;
    float _1002 = float(_1000);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1012 = _970 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1014 = isnan(_970);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = -_986;
    float _1026 = _1024 + 1.0;
    float _1028 = 1.0 / _1010;
    float _1030 = _1022 * _1026;
    float _1032 = -_1022;
    float _1034 = _1032 + 1.0;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1036;
    bool _1040 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _1042 = 1.0 / _1006;
    float _1044 = _1002 * _1034;
    float _1046 = -_1002;
    float _1048 = _1046 + 1.0;
    float _1050 = _990 * _1028;
    float _1052 = _974 * _1042;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _1058;
    float _1062 = fma(_1038, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1064 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1066 = fma(_1060, _1052, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _1068 = in.m_49.x;
    float _1070 = in.m_49.y;
    float _1072 = in.m_49.z;
    float _1074 = _1062 * _1044;
    float _1076 = _1064 * _1044;
    float _1078 = _1066 * _1044;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1074);
    float _1094 = fma(_1082, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1096 = fma(_1086, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1098 = fma(_1090, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1100 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1076);
    float _1102 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1078);
    float _1104 = fma(_1094, _1030, _1092);
    float _1106 = fma(_1096, _1030, _1100);
    float _1108 = fma(_1098, _1030, _1102);
    float _1110 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1104);
    float _1112 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1106);
    float _1114 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[145].z, _1108);
    float _1116 = _1110 * _1068;
    float _1118 = _1112 * _1070;
    float _1120 = _1114 * _1072;
    bool _1122 = !_1040;
    float _1140;
    if (!_1122)
    {
        float _1124 = in.m_51.x;
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1128 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _1132 = _1130 * _1126;
        float _1134 = floor(_1132);
        float _1136 = -_1134;
        float _1138 = _1132 + _1136;
        _1140 = _1138;
        _1142 = true;
    }
    else
    {
        float _1144 = float(_90);
        float _1146 = 1.0 / _1144;
        float _1148 = _124 * _1146;
        _1140 = _1148;
    }
    _1142 = false;
    float _1150 = _1140;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1154 = _1150 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1158 = _1150 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1162 = _1150 + _1160;
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1178 = _1176 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _1180 = 1.0 / _1166;
    bool _1182 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1184 = isnan(_1150);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    bool _1194 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1196 = isnan(_1150);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1202 = _1198 || _1200;
    float _1204 = float(_1202);
    float _1206 = 1.0 / _1178;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _1210 = _1150 + _1208;
    float _1212 = 1.0 / _1170;
    float _1214 = _1154 * _1180;
    bool _1216 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1218 = isnan(_1150);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1224 = _1220 || _1222;
    float _1226 = float(_1224);
    bool _1228 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1230 = 1.0 / _1174;
    float _1232 = _1210 * _1206;
    bool _1234 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _1236 = isnan(_1150);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = -_1226;
    float _1248 = _1246 + 1.0;
    float _1250 = -_1244;
    float _1252 = _1250 + 1.0;
    float _1254 = _1158 * _1212;
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1256;
    float _1260 = _1192 * _1252;
    float _1262 = -_1192;
    float _1264 = _1262 + 1.0;
    float _1266 = fma(_1258, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1268 = _1162 * _1230;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1274;
    float _1278 = fma(_1272, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1280 = fma(_1276, _1214, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1282 = _1150 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1284 = isnan(_1150);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = _1226 * _1264;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1308 = _1292 * _1248;
    float _1310 = -_1292;
    float _1312 = _1310 + 1.0;
    float _1314 = fma(_1302, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1316 = fma(_1298, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1318 = fma(_1306, _1254, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1320 = _1204 * _1312;
    float _1322 = _1278 * _1320;
    float _1324 = _1266 * _1320;
    float _1326 = -_1204;
    float _1328 = _1326 + 1.0;
    float _1330 = _1280 * _1320;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1340;
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1324);
    float _1346 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1322);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1330);
    float _1350 = fma(_1334, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1352 = fma(_1338, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1354 = fma(_1342, _1268, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1356 = fma(_1314, _1308, _1344);
    float _1358 = fma(_1316, _1308, _1346);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1366 = _1364 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1368 = fma(_1318, _1308, _1348);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1374 = fma(_1350, _1294, _1356);
    float _1376 = fma(_1362, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1378 = fma(_1366, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1380 = fma(_1352, _1294, _1358);
    float _1382 = fma(_1372, _1232, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1384 = fma(_1354, _1294, _1368);
    float _1386 = fma(_1376, _1260, _1374);
    float _1388 = fma(_1378, _1260, _1380);
    float _1390 = fma(_1382, _1260, _1384);
    float _1392 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1386);
    float _1394 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1388);
    float _1396 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1390);
    bool _1398 = !_1228;
    float _1416;
    if (!_1398)
    {
        float _1400 = in.m_51.x;
        float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1404 = _1400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1406 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _1408 = _1406 * _1402;
        float _1410 = floor(_1408);
        float _1412 = -_1410;
        float _1414 = _1408 + _1412;
        _1416 = _1414;
        _1418 = true;
    }
    else
    {
        float _1420 = float(_90);
        float _1422 = 1.0 / _1420;
        float _1424 = _124 * _1422;
        _1416 = _1424;
    }
    _1418 = false;
    float _1426 = _1416;
    float _1428 = in.m_51.z;
    float _1430 = _934 * _934;
    float _1432 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1434 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1436 = in.m_51.x;
    float _1438 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1440 = _536 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = in.m_51.y;
    float _1448 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1432);
    float _1450 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1434);
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1454 = _1452 != 0;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1458 = _1456 != 0;
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1462 = _1460 != 0;
    float _1464 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1438);
    float _1466 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1440);
    float _1468 = _604 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _606 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1476 = _608 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1478 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1448);
    int _1480 = abs(_1472);
    float _1482 = _1444 * _124;
    float _1484 = _1428 * 2.0;
    float _1486 = _1118 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1488 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1450);
    float _1490 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1464);
    float _1492 = _1436 * 2.0;
    float _1494 = floor(_1484);
    float _1496 = fma(_542, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1466);
    float _1498 = _1120 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1500 = _1446 * 2.0;
    float _1502 = _1488 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1504 = _1490 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1508 = floor(_1492);
    float _1510 = fma(_936, _936, _1430);
    float _1512 = _272 * _1502;
    float _1514 = _480 * _1504;
    float _1516 = fma(_938, _938, _1510);
    float _1518 = _1436 + _1446;
    float _1520 = floor(_1500);
    float _1522 = _1446 + _1428;
    bool _1524 = _1494 > 0.0;
    float _1526 = _1518 + (-1.0);
    bool _1528 = _1494 >= 0.0;
    bool _1530 = isnan(_1494);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    float _1538 = _1522 + (-1.0);
    float _1540 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1542 = _1508 > 0.0;
    float _1544 = rsqrt(_1516);
    bool _1546 = _1508 >= 0.0;
    bool _1548 = isnan(_1508);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1558 = _1536 ? 0 : 1;
    int _1560 = _1554 ? 0 : 1;
    int _1562 = ~_1558;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    float _1568 = exp2(_1482);
    int _1570 = ~_1560;
    int _1572 = _1570 + 1;
    int _1574 = _1572 + 1;
    int _1576 = _1566;
    int _1578 = _1574;
    float _1580 = _1506;
    if (!_1524)
    {
        int _1582 = ~_1558;
        int _1584 = _1582 + 1;
        _1576 = _1584;
    }
    int _1586 = _1576;
    if (!_1542)
    {
        int _1588 = ~_1560;
        int _1590 = _1588 + 1;
        _1578 = _1590;
    }
    int _1592 = _1578;
    float _1594 = in.m_53.x;
    float _1596 = in.m_53.y;
    float _1598 = in.m_53.z;
    float _1600 = _1544 * _934;
    bool _1602 = _1520 > 0.0;
    float _1604 = _1544 * _936;
    bool _1606 = _1520 >= 0.0;
    bool _1608 = isnan(_1520);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan(0.0);
    bool _1614 = _1610 || _1612;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1618 = 1.0 + _1616;
    bool _1620 = !_1454;
    int _1622 = _1620 ? 0 : 1;
    float _1624 = _612 * _1600;
    float _1626 = float(_1586);
    float _1628 = 1.0 / _1618;
    int _1630 = abs(_1622);
    float _1632 = _1544 * _938;
    float _1634 = fma(_610, _1604, _1624);
    bool _1636 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1638 = isnan(1.0);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1644 = _1640 || _1642;
    float _1646 = -_1568;
    float _1648 = _1646 + 1.0;
    bool _1650 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    bool _1656 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1658 = _1654 || _1656;
    int _1660 = _1614 ? 0 : 1;
    float _1662 = float(_1630);
    float _1664 = float(_1480);
    float _1666 = _1658 ? _1648 : 0.0;
    float _1668 = _1662 * _1626;
    float _1670 = fma(_614, _1632, _1634);
    int _1672 = ~_1660;
    int _1674 = _1672 + 1;
    int _1676 = _1674 + 1;
    float _1678 = _1668 * (-2.0);
    int _1680 = _1676;
    float _1682 = _1604;
    if (!_1602)
    {
        int _1684 = ~_1660;
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    if (_1644)
    {
        float _1690 = _1666 * _1628;
        _128 = _1690;
    }
    float _1692 = _128;
    float _1694 = abs(_1670);
    bool _1696 = _1694 > 0.99989998340606689453125;
    float _1698 = _1436 + (-0.5);
    float _1700 = fma(_1678, _1594, _1594);
    bool _1702 = !_1462;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = fma(_1540, _1678, _1540);
    float _1708 = float(_1592);
    float _1710 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1700);
    int _1712 = abs(_1704);
    float _1714 = _1436 + _1428;
    float _1716 = _1428 + (-0.5);
    float _1718 = fma(_1706, _1692, _1710);
    float _1720 = float(_1712);
    float _1722 = _1664 * _1708;
    float _1724 = float(_1688);
    float _1726 = _1714 + (-1.0);
    float _1728 = in.m_55.x;
    float _1730 = in.m_55.y;
    float _1732 = in.m_55.z;
    float _1734 = _1722 * (-2.0);
    if (_1696)
    {
        float _1736 = fma(_1468, 0.001000000047497451305389404296875, _610);
        _622 = _1736;
    }
    float _1738 = _622;
    float _1740 = _1720 * _1724;
    float _1742 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1744 = fma(_1556, _1734, _1556);
    float _1746 = fma(_1734, _1596, _1596);
    float _1748 = _1740 * (-2.0);
    float _1750 = _1446 + (-0.5);
    if (_1696)
    {
        float _1752 = fma(_1474, 0.001000000047497451305389404296875, _612);
        _624 = _1752;
    }
    float _1754 = _624;
    if (_1696)
    {
        float _1756 = fma(_1476, 0.001000000047497451305389404296875, _614);
        _626 = _1756;
    }
    float _1758 = _626;
    float _1760 = fma(_1742, _1748, _1742);
    float _1762 = fma(_1748, _1598, _1598);
    float _1764 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1746);
    float _1766 = -_1738;
    float _1768 = _1632 * _1766;
    float _1770 = -_1758;
    float _1772 = _1600 * _1770;
    float _1774 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1762);
    float _1776 = fma(_1744, _1692, _1764);
    float _1778 = _1718 * 0.15915493667125701904296875;
    float _1780 = fma(_1760, _1692, _1774);
    float _1782 = -_1758;
    float _1784 = -_1768;
    float _1786 = fma(_1604, _1782, _1784);
    float _1788 = -_1754;
    float _1790 = -_1772;
    float _1792 = fma(_1632, _1788, _1790);
    float _1794 = _1776 * 0.15915493667125701904296875;
    float _1796 = _1780 * 0.15915493667125701904296875;
    float _1798 = -_1754;
    float _1800 = _1604 * _1798;
    float _1802 = _1786 * _1786;
    float _1804 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1728);
    float _1806 = _1778 * 6.283185482025146484375;
    float _1808 = sin(_1806);
    float _1810 = -_1738;
    float _1812 = -_1800;
    float _1814 = fma(_1600, _1810, _1812);
    float _1816 = fma(_1792, _1792, _1802);
    float _1818 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1730);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1732);
    float _1824 = fma(_1814, _1814, _1816);
    float _1826 = _1478 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1828 = _1778 * 6.283185482025146484375;
    float _1830 = cos(_1828);
    float _1832 = _1818 * _1804;
    float _1834 = _1486 * _1820;
    float _1836 = _174 * _1826;
    float _1838 = _1498 * _1822;
    bool _1840 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1842 = isnan(0.5);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1848 = _1844 || _1846;
    float _1850 = _1794 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1794 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1796 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1808 * _1852;
    float _1864 = _1830 * _1852;
    float _1866 = _1796 * 6.283185482025146484375;
    float _1868 = sin(_1866);
    float _1870 = _1830 * _1856;
    float _1872 = _1808 * _1856;
    float _1874 = rsqrt(_1824);
    float _1876 = _1808 * _1860;
    float _1878 = _1856 * _1860;
    float _1880 = _1830 * _1860;
    float _1882 = _1852 * _1860;
    float _1884 = fma(_1868, _1870, _1862);
    float _1886 = fma(_1868, _1862, _1870);
    float _1888 = -_1864;
    float _1890 = fma(_1868, _1872, _1888);
    float _1892 = -_1872;
    float _1894 = fma(_1868, _1864, _1892);
    float _1896 = _1884 * _1604;
    float _1898 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1900 = _1894 * _1604;
    float _1902 = _1814 * _1874;
    float _1904 = _1792 * _1874;
    float _1906 = _1880 * _1604;
    float _1908 = _1786 * _1874;
    float _1910 = _1600 * _1902;
    float _1912 = fma(_1878, _1904, _1896);
    float _1914 = -_1868;
    float _1916 = fma(_1914, _1904, _1906);
    float _1918 = fma(_1882, _1904, _1900);
    float _1920 = -_1910;
    float _1922 = fma(_1632, _1908, _1920);
    float _1924 = _1894 * _1632;
    float _1926 = _1894 * _1600;
    float _1928 = fma(_1890, _1922, _1912);
    float _1930 = fma(_1876, _1922, _1916);
    float _1932 = fma(_1886, _1922, _1918);
    float _1934 = _1880 * _1632;
    float _1936 = _1604 * _1908;
    float _1938 = _1884 * _1632;
    float _1940 = _1834 * _1930;
    float _1942 = -_1868;
    float _1944 = fma(_1942, _1902, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1600, _1904, _1946);
    float _1950 = fma(_1878, _1902, _1938);
    float _1952 = fma(_1882, _1902, _1924);
    float _1954 = fma(_1832, _1928, _1940);
    float _1956 = fma(_1876, _1948, _1944);
    float _1958 = fma(_1890, _1948, _1950);
    float _1960 = fma(_1886, _1948, _1952);
    float _1962 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1964 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1898);
    float _1966 = _1834 * _1956;
    float _1968 = fma(_1838, _1932, _1954);
    float _1970 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1962);
    float _1972 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1964);
    float _1974 = fma(_1832, _1958, _1966);
    float _1976 = _1632 * _1904;
    float _1978 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1970);
    float _1980 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1972);
    float _1982 = fma(_1838, _1960, _1974);
    float _1984 = _1512 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1986 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1978);
    float _1988 = _1980 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1990 = _1884 * _1600;
    float _1992 = -_1976;
    float _1994 = fma(_1604, _1902, _1992);
    float _1996 = _1986 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1998 = _1988 + _1982;
    float _2000 = _1880 * _1600;
    float _2002 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1984);
    float _2004 = _1996 + _1968;
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2008 = _1998 + _2006;
    float _2010 = -_1868;
    float _2012 = fma(_2010, _1908, _2000);
    float _2014 = fma(_1878, _1908, _1990);
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2018 = _2004 + _2016;
    float _2020 = _2008 * _2008;
    float _2022 = fma(_1876, _1994, _2012);
    float _2024 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2002);
    float _2026 = fma(_1882, _1908, _1926);
    float _2028 = fma(_2018, _2018, _2020);
    float _2030 = fma(_1890, _1994, _2014);
    float _2032 = _1834 * _2022;
    float _2034 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2024);
    float _2036 = sqrt(_2028);
    float _2038 = fma(_1886, _1994, _2026);
    float _2040 = fma(_1832, _2030, _2032);
    float _2042 = _2034 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _2044 = fma(_1838, _2038, _2040);
    float _2046 = _2042 + _2044;
    bool _2048 = _2036 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2050 = _2040;
    float _2052 = _2032;
    float _2054 = _2034;
    float _2056 = _1994;
    float _2058 = 0.5;
    if (!_2048)
    {
        _2050 = _2004;
    }
    float _2060 = _2050;
    float _2062 = _2060;
    if (!_2048)
    {
        _2052 = _1998;
    }
    float _2064 = _2052;
    float _2066 = _2064;
    if (!_2048)
    {
        _2054 = _2046;
    }
    float _2068 = _2054;
    bool _2070 = !_2048;
    float _2072 = _2068;
    if (!_2070)
    {
        float _2074 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2078 = _2036 + _2076;
        float _2080 = rsqrt(_2028);
        float _2082 = _2078 * _2074;
        float _2084 = _2046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = _2082 * 0.15915493667125701904296875;
        float _2088 = _2086 * 6.283185482025146484375;
        float _2090 = sin(_2088);
        float _2092 = _2086 * 6.283185482025146484375;
        float _2094 = cos(_2092);
        float _2096 = fma(_2090, _2084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2098 = _2080 * _2096;
        float _2100 = _2094 + (-1.0);
        float _2102 = fma(_2018, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2104 = fma(_2008, _2098, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2106 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2108 = fma(_2046, _2094, _2106);
        _2062 = _2102;
        _2072 = _2108;
        _2066 = _2104;
    }
    float _2110 = _2062;
    float _2112 = _2072;
    float _2114 = _2066;
    float _2116 = _2112;
    float _2118 = _2110;
    float _2120 = _2114;
    if (!_1848)
    {
        float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2124 = _2042 + _2122;
        float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2128 = _1996 + _2126;
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2132 = -_1996;
        float _2134 = _2132 + _2110;
        float _2136 = _2124 * _2124;
        float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2140 = _1988 + _2138;
        float _2142 = -_2042;
        float _2144 = _2142 + _2112;
        float _2146 = fma(_2128, _2128, _2136);
        float _2148 = fma(_2140, _2140, _2146);
        float _2150 = sqrt(_2148);
        float _2152 = precise::min(_2150, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2154 = _2152 * _2130;
        float _2156 = -_1988;
        float _2158 = _2156 + _2114;
        float _2160 = fma(_2134, _2154, _1996);
        float _2162 = fma(_2144, _2154, _2042);
        float _2164 = fma(_2158, _2154, _1988);
        _2116 = _2162;
        _2118 = _2160;
        _2120 = _2164;
    }
    float _2166 = _2116;
    float _2168 = _2118;
    float _2170 = _2120;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2166 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2168 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2170 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2186;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    if (_2208)
    {
        float _2222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2222;
    }
    float _2224 = _2214;
    if (_2208)
    {
        float _2226 = rsqrt(_2204);
        _2216 = _2226;
    }
    float _2228 = _2216;
    float _2230 = _2228;
    if (_2208)
    {
        float _2232 = _2212 * _2224;
        _2218 = _2232;
    }
    float _2234 = _2218;
    if (_2208)
    {
        float _2236 = _2234 * 0.15915493667125701904296875;
        _2056 = _2236;
    }
    float _2238 = _2056;
    float _2240 = _2182;
    float _2242 = _2238;
    if (_2208)
    {
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2240 = _2246;
    }
    float _2248 = _2240;
    float _2250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2252 = precise::max(0.0, _2250);
    float _2254 = _2224;
    float _2256 = _2252;
    if (_2208)
    {
        float _2258 = _2238 * 6.283185482025146484375;
        float _2260 = cos(_2258);
        _2254 = _2260;
    }
    float _2262 = _2254;
    float _2264 = -_2194;
    float _2266 = -_2252;
    float _2268 = fma(_2174, _2264, _2266);
    if (_2208)
    {
        float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2270;
    }
    float _2272 = _2220;
    float _2274 = _2272;
    float _2276 = _2248;
    if (_2208)
    {
        float _2278 = fma(_2248, _2272, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2274 = _2278;
    }
    float _2280 = _2274;
    float _2282 = _2280;
    if (!_2208)
    {
        _2276 = _2196;
    }
    float _2284 = _2276;
    float _2286 = _2284;
    float _2288 = _2262;
    if (_2208)
    {
        float _2290 = _2262 + (-1.0);
        _2256 = _2290;
    }
    float _2292 = _2256;
    float _2294 = _2292;
    if (_2208)
    {
        float _2296 = _2228 * _2280;
        _1682 = _2296;
    }
    float _2298 = _1682;
    if (!_2208)
    {
        _2282 = _2268;
    }
    float _2300 = _2282;
    float _2302 = _2300;
    if (_2208)
    {
        float _2304 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2304;
    }
    float _2306 = _2242;
    if (_2208)
    {
        float _2308 = _2196 * _2298;
        _2286 = _2308;
    }
    float _2310 = _2286;
    if (!_2208)
    {
        _2294 = _2198;
    }
    float _2312 = _2294;
    float _2314 = _2312;
    if (_2208)
    {
        float _2316 = _2198 * _2298;
        _2314 = _2316;
    }
    float _2318 = _2314;
    if (!_2208)
    {
        _2230 = _2200;
    }
    float _2320 = _2230;
    float _2322 = _2320;
    if (_2208)
    {
        float _2324 = fma(_2268, _2262, _2306);
        _2302 = _2324;
    }
    float _2326 = _2302;
    if (_2208)
    {
        float _2328 = _2310 * _2310;
        _2322 = _2328;
    }
    float _2330 = _2322;
    if (!_2208)
    {
        _2288 = _2202;
    }
    float _2332 = _2288;
    float _2334 = _2332;
    if (_2208)
    {
        float _2336 = _2318 * _2318;
        _2334 = _2336;
    }
    float _2338 = _2334;
    float _2340 = fma(_2326, _2326, _2330);
    float _2342 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2344 = _2340 + _2338;
    float _2346 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2342);
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2350 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2348);
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2358 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2346);
    float _2360 = rsqrt(_2344);
    float _2362 = -_2352;
    float _2364 = _2362 + 1.0;
    float _2366 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2368 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2370 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2372 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2366);
    float _2376 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2368);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2370);
    float _2380 = abs(_2364);
    float _2382 = log2(_2380);
    float _2384 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2374);
    float _2386 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2388 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2378);
    float _2390 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2394 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2396 = _2360 * _2310;
    float _2398 = _2388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2400 = _2360 * _2326;
    float _2402 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2394);
    float _2404 = _2396 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2406 = _2360 * _2318;
    float _2408 = -_2390;
    float _2410 = fma(_2408, _2356, 1.0);
    float _2412 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2402);
    float _2414 = -_2404;
    float _2416 = fma(_2400, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2414);
    float _2418 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2420 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2412);
    float _2422 = -_2406;
    float _2424 = fma(_2422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2416);
    float _2426 = exp2(_2418);
    float _2428 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2430 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2432 = fma(_2424, -0.5, 0.5);
    float _2434 = fma(_2424, 0.5, 0.5);
    float _2436 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2428);
    float _2438 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2430);
    float _2440 = _2400 + 1.0;
    float _2442 = log2(_2410);
    float _2444 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2436);
    float _2446 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2438);
    float _2448 = fma(_2434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2450 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2444);
    float _2452 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2446);
    float _2454 = fma(_2434, _2448, -0.212114393711090087890625);
    float _2456 = 1.0 / _2420;
    float _2458 = -_2400;
    float _2460 = fma(_2426, _2440, _2458);
    float _2462 = fma(_2434, _2454, 1.570728778839111328125);
    float _2464 = sqrt(_2432);
    float _2466 = _2442 * 0.693147182464599609375;
    float _2468 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2470 = _2450 * _2456;
    float _2472 = _2452 * _2456;
    float _2474 = fma(_2470, 0.5, 0.5);
    float _2476 = fma(_2472, -0.5, 0.5);
    float _2478 = fma(_2460, 0.5, 0.5);
    float _2480 = _2464 * 0.636619746685028076171875;
    float3 _6849 = float3(_2474, _2476, _2468);
    float _2482 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6849, float3(0.0), isnan(_6849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6849, float3(0.0), isnan(_6849)), level(0.0)).x;
    float _2484 = -_2462;
    float _2486 = fma(_2480, _2484, 1.0);
    float3 _6865 = float3(_2474, _2476, _2468);
    float4 _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6865, float3(0.0), isnan(_6865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6865, float3(0.0), isnan(_6865)), level(0.0)).xyzw;
    float _2491 = _2489.x;
    float _2493 = _2489.y;
    float _2495 = _2489.z;
    float _2497 = _2489.w;
    float2 _6882 = float2(_2486, _2478);
    float3 _2501 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6882, float2(0.0), isnan(_6882)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6882, float2(0.0), isnan(_6882)), level(0.0)).xyz;
    float _2503 = _2501.x;
    float _2505 = _2501.y;
    float _2507 = _2501.z;
    float _2509 = in.m_57.y;
    float _2511 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2513 = in.m_57.x;
    bool _2515 = _1446 > 0.5;
    float _2517 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _2519 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2521 = _2519 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2525 = _2523 != 0;
    float _2527 = in.m_59.x;
    float _2529 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2517);
    float _2531 = 1.0 / _2521;
    float _2533 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2537 = _2535 != 0;
    float _2539 = _2529 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _2541 = _1436 > 0.5;
    bool _2543 = _2541 && _2525;
    float _2545 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2533);
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2549 = _1426 + _2547;
    float _2551 = 1.0 / _2539;
    bool _2553 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2555 = isnan(0.5);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2561 = _2557 || _2559;
    float _2563 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2567 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2565;
    float _2569 = in.m_59.y;
    float _2571 = -_2509;
    float _2573 = _2571 + 1.0;
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2577 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2579 = _2567 * _2531;
    float _2581 = _2509;
    float _2583 = _2579;
    float _2585 = _2513;
    if (_2525)
    {
        _2058 = _2513;
    }
    float _2587 = _2058;
    float _2589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2591 = _2587;
    if (_2537)
    {
        float _2593 = _2515 ? _2573 : _2509;
        _2581 = _2593;
    }
    float _2595 = _2581;
    float _2597 = _2575 + _2539;
    float _2599 = fma(_2579, _2549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    if (!_2525)
    {
        _2583 = _2513;
    }
    float _2601 = _2583;
    out.m_61.x = _2527;
    float _2603 = _2527;
    float _2605 = _2601;
    if (!_2561)
    {
        _2585 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2607 = _2585;
    float _2609 = _2597 * _2551;
    float _2611 = _2609 * 0.5;
    float _2613 = _2607;
    if (!_2561)
    {
        _1580 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2615 = _1580;
    float _2617 = _2595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2543)
    {
        float _2619 = -_2587;
        float _2621 = _2619 + 1.0;
        _2591 = _2621;
    }
    float _2623 = _2591;
    if (!_2561)
    {
        float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2627 = fma(_2611, _2607, _2625);
        _2613 = _2627;
    }
    float _2629 = _2613;
    float _2631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (!_2561)
    {
        float _2633 = -_2615;
        float _2635 = _2633 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2603 = _2635;
    }
    float _2637 = _2603;
    bool _2639 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2641 = isnan(_1426);
    bool _2643 = _2639 || _2641;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2647 = _2643 || _2645;
    float _2649 = float(_2647);
    float _2651 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2653 = _1426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2655 = isnan(_1426);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = _2617 * _2589;
    float _2667 = -_2649;
    float _2669 = _2667 + 1.0;
    float _2671 = _2629;
    if (!_2561)
    {
        float _2673 = 1.0 / _2629;
        _2671 = _2673;
    }
    float _2675 = _2671;
    out.m_61.y = _2569;
    if (_2525)
    {
        _2605 = _2623;
    }
    float _2677 = _2605;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2681 = _2663 * _2669;
    float _2683 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2685 = -_2663;
    float _2687 = _2685 + 1.0;
    float _2689 = (*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2691 = _2687;
    if (!_2561)
    {
        float _2693 = 1.0 / _2637;
        _2689 = _2693;
    }
    float _2695 = _2689;
    float _2697 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2699 = _2679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2701 = _2683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2703 = _2599 * _2681;
    float _2705 = _2697 * _2631;
    float _2707 = in.m_59.z;
    float _2709 = _2697;
    if (!_2561)
    {
        float _2711 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2713 = -_2615;
        float _2715 = fma(_2675, _2711, _2713);
        _2709 = _2715;
    }
    float _2717 = _2709;
    float _2719 = fma(_2687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2703);
    if (_2561)
    {
        _2691 = 1.0;
    }
    float _2721 = _2691;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2725 = in.m_59.w;
    float _2727 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2651);
    float _2729 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2731 = _2721;
    if (!_2561)
    {
        float _2733 = _2717 * _2695;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2731 = _2735;
    }
    float _2737 = _2731;
    float _2739 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2741 = exp2(_2577);
    float _2743 = fma(_2649, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2719);
    float _2745 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    bool _2747 = _2737 > 0.0;
    bool _2749 = isnan(_2737);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    out.m_63.x = _2729;
    out.m_63.y = _2699;
    out.m_63.z = _2701;
    out.m_63.w = _2739;
    float _2757 = fma(_2398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2745);
    out.m_65.x = _2705;
    out.m_65.y = _2665;
    float _2759 = _2450 + _2420;
    float _2761 = _2757 + _2420;
    out.gl_Position.x = _2450;
    out.gl_Position.y = _2452;
    out.gl_Position.z = _2757;
    out.gl_Position.w = _2420;
    float _2763 = _2759 * 0.5;
    float _2765 = _2761 * 0.5;
    float _2767 = -_2741;
    float _2769 = _2767 + 1.0;
    out.m_61.z = _2707;
    float _2771 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2773 = _2420 * 0.5;
    float _2775 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2777 = _1392 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2779 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2781 = fma(_2452, -0.5, _2773);
    float _2783 = _2737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2785 = _2777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2743 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2783 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_61.w = _2725;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    out.m_69.x = _2763;
    out.m_69.y = _2781;
    out.m_69.z = _2765;
    out.m_69.w = _2420;
    out.m_45.x = _2793;
    float _2795 = _2775 * _2482;
    float _2797 = -_2775;
    float _2799 = _2797 + 1.0;
    float _2801 = _2497 * _2795;
    float _2803 = _2497 * _2799;
    float _2805 = _2507 * _2795;
    float _2807 = fma(_2503, _2801, _2491);
    float _2809 = fma(_2505, _2801, _2493);
    float _2811 = fma(_2497, _2805, _2495);
    out.m_71.x = _2807;
    out.m_71.y = _2809;
    out.m_71.z = _2811;
    out.m_71.w = _2803;
    if (_2755)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

