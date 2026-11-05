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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2352 = as_type<float>(_140);
        out.gl_Position.z = _2352;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _320 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _318);
    float _328 = fma(_320, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _382;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = 1.0 / _390;
    float _416 = _334 * _370;
    float _418 = _410 * _392;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _332 * _368;
    bool _438 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _440 = isnan(_364);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = _364 + _450;
    float _454 = 1.0 / _386;
    float _456 = _422 * _406;
    float _458 = -_434;
    float _460 = _458 + 1.0;
    float _462 = _330 * _366;
    float _464 = _448 * _460;
    float _466 = -_448;
    float _468 = _466 + 1.0;
    float _470 = _374 * _414;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _452 * _454;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _418, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _418, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _418, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _404 * _490;
    float _528 = -_404;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _456, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _456, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _456, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = _510 * _542;
    float _550 = _512 * _542;
    float _552 = -_524;
    float _554 = _552 + 1.0;
    float _556 = _504 * _542;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _570 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_560, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_544, _526, _566);
    float _580 = fma(_540, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _592 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_576, _492, _578);
    float _602 = fma(_586, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_592, _492, _580);
    float _610 = fma(_594, _492, _582);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_412;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = 1.0 / _672;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = _690 * _686;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _652 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _724 = _652 + _722;
    float _726 = fma(_716, _720, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _728 = _684 * _694;
    float _730 = -_684;
    float _732 = _730 + 1.0;
    float _734 = _714 * _710;
    float _736 = -_706;
    float _738 = _736 + 1.0;
    float _740 = _726 * _728;
    float _742 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = fma(_734, _724, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _746 = _668 * _738;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_744, _746, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _758;
    out.m_55.z = _752;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _824 = 1.0 / _810;
    float _826 = 1.0 / _822;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _830 = _794 + _828;
    bool _832 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _834 = 1.0 / _818;
    float _836 = _798 * _824;
    bool _838 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _840 = isnan(_794);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_794);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _814;
    float _864 = _830 * _826;
    bool _866 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _868 = isnan(_794);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_876;
    float _880 = _878 + 1.0;
    float _882 = _802 * _834;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _896;
    float _900 = _848 * _880;
    bool _902 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _904 = isnan(_794);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_848;
    float _916 = _914 + 1.0;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    float _922 = fma(_898, _836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _924 = _806 * _862;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _912 * _920;
    float _936 = -_912;
    float _938 = _936 + 1.0;
    float _940 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _944 = _894 * _916;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = _860 * _938;
    float _960 = fma(_948, _924, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = fma(_952, _924, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _964 = fma(_956, _924, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _966 = _940 * _958;
    float _968 = _942 * _958;
    float _970 = _922 * _958;
    float _972 = -_860;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _970);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _994 = fma(_978, _882, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_960, _934, _988);
    float _998 = fma(_964, _934, _990);
    float _1000 = fma(_982, _882, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1002 = fma(_962, _934, _992);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1012 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _944, _996);
    float _1020 = fma(_1006, _864, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1010, _864, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_1000, _944, _1002);
    float _1026 = fma(_1016, _864, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_1012, _944, _998);
    float _1030 = fma(_1020, _900, _1018);
    float _1032 = fma(_1022, _900, _1024);
    float _1034 = fma(_1026, _900, _1028);
    float _1036 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_832;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1078 * _1178;
    float _1186 = _1080 * _1180;
    float _1188 = _1154 * _1174;
    float _1190 = _1148 * _1174;
    float _1192 = _1160 * _1174;
    float _1194 = _1182 * _1176;
    float _1196 = _1130 * _1188;
    float _1198 = _1128 * _1190;
    float _1200 = -_1196;
    float _1202 = fma(_1126, _1190, _1200);
    float _1204 = -_1198;
    float _1206 = fma(_1130, _1192, _1204);
    float _1208 = _1184 * _1202;
    float _1210 = _1184 * _1206;
    float _1212 = fma(_1194, _1192, _1208);
    float _1214 = fma(_1194, _1188, _1210);
    float _1216 = fma(_1186, _1128, _1212);
    float _1218 = fma(_1186, _1126, _1214);
    float _1220 = _1126 * _1192;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1188, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1184 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1194, _1190, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1186, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1190;
    float _1258 = _1224;
    float _1260 = _1100;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1282 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = fma(_1236, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1306 = fma(_1232, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1308 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1310 = fma(_1250, _1296, _1308);
        _1274 = _1310;
        _1264 = _1304;
        _1268 = _1306;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1324, _1324, _1332);
    float _1346 = fma(_1328, _1328, _1344);
    float _1348 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1350 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1348);
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1350);
    float _1358 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1360 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1356);
    float _1362 = 1.0 / _1358;
    float _1364 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1366 = _1364 + _1358;
    bool _1368 = _1352 > 0.0;
    float _1370 = _1352;
    float _1372 = _1314;
    float _1374 = _1316;
    float _1376 = _1346;
    float _1378 = _1312;
    if (_1342)
    {
        _1370 = 1.0;
    }
    float _1380 = _1370;
    float _1382 = _1366 * _1362;
    float _1384 = _1382 * 0.5;
    float _1386 = _1384;
    float _1388 = _1380;
    if (!_1368)
    {
        _1260 = _1312;
    }
    float _1390 = _1260;
    bool _1392 = !_1368;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = _164 * _164;
        float _1398 = fma(_162, _162, _1396);
        float _1400 = fma(_166, _166, _1398);
        float _1402 = rsqrt(_1346);
        float _1404 = sqrt(_1400);
        float _1406 = _1324 * _1402;
        float _1408 = _1328 * _1402;
        bool _1410 = _1404 > 0.0;
        float _1412 = _1320 * _1402;
        float _1414 = _1402;
        if (!_1410)
        {
            _1414 = _1312;
        }
        float _1416 = _1414;
        bool _1418 = !_1410;
        _1394 = _1416;
        if (!_1418)
        {
            float _1420 = rsqrt(_1400);
            float _1422 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1424 = _164 * _1420;
            float _1426 = _162 * _1420;
            float _1428 = _1412 * _1424;
            float _1430 = _166 * _1420;
            float _1432 = fma(_1406, _1426, _1428);
            float _1434 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1436 = fma(_1408, _1430, _1432);
            float _1438 = _1436 * _1434;
            float _1440 = fma(_162, _1438, _1314);
            float _1442 = fma(_164, _1438, _1312);
            float _1444 = fma(_166, _1438, _1316);
            _1394 = _1442;
            _1372 = _1440;
            _1374 = _1444;
            _1376 = _1438;
        }
    }
    float _1446 = _1394;
    float _1448 = _1372;
    float _1450 = _1374;
    float _1452 = _1376;
    float _1454 = _1452;
    if (!_1342)
    {
        float _1456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1458 = _1456 * 0.15915493667125701904296875;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1462);
        float _1466 = _1458 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1460 * 0.15915493667125701904296875;
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1464;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = 1.0 / _1488;
        float _1498 = 1.0 / _1494;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = _1490 * _1500;
        float _1504 = _1486 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1502, _1506);
        float _1510 = _1508 * _1498;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1458;
        _1386 = _1490;
        _1378 = _1470;
        _1388 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1386;
    float _1518 = _1378;
    float _1520 = _1388;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1446 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1448 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1450 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1544 = _1528 * _1542;
    float _1546 = _1532 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _1514;
    float _1564 = _1560;
    float _1566 = _1516;
    float _1568 = _1524;
    float _1570 = _1542;
    float _1572 = _1544;
    if (_1556)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1574;
    }
    float _1576 = _1562;
    float _1578 = _1576;
    if (_1556)
    {
        float _1580 = _1560 * _1576;
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1556)
    {
        float _1584 = rsqrt(_1552);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1556)
    {
        float _1590 = _1582 * 0.15915493667125701904296875;
        _1566 = _1590;
    }
    float _1592 = _1566;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = _1532;
    if (_1556)
    {
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = precise::max(0.0, _1594);
    float _1606 = _1518;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = sqrt(_1538);
    float _1628 = _1602;
    float _1630 = _1624;
    if (_1556)
    {
        float _1632 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = _1634;
    if (!_1556)
    {
        _1630 = _1548;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (_1556)
    {
        float _1642 = _1586 * _1634;
        _1570 = _1642;
    }
    float _1644 = _1570;
    if (!_1556)
    {
        _1636 = _1620;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    float _1650 = _1614;
    if (_1556)
    {
        float _1652 = _1614 + (-1.0);
        _1608 = _1652;
    }
    float _1654 = _1608;
    float _1656 = _1654;
    if (_1556)
    {
        float _1658 = _1544 * _1644;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1662;
    }
    float _1664 = _1588;
    if (!_1556)
    {
        _1656 = _1546;
    }
    float _1666 = _1656;
    float _1668 = _1666;
    if (_1556)
    {
        float _1670 = _1546 * _1644;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1556)
    {
        float _1674 = _1660 * _1660;
        _1640 = _1674;
    }
    float _1676 = _1640;
    if (_1556)
    {
        float _1678 = fma(_1620, _1614, _1664);
        _1648 = _1678;
    }
    float _1680 = _1648;
    if (!_1556)
    {
        _1650 = _1550;
    }
    float _1682 = _1650;
    float _1684 = _1682;
    if (_1556)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1680, _1680, _1676);
    float _1692 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1694 = _1690 + _1688;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1692);
    float _1704 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = rsqrt(_1694);
    float _1714 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1716 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1718 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1706);
    float _1724 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1716);
    float _1726 = abs(_1710);
    float _1728 = log2(_1726);
    float _1730 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1718);
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1738 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1712 * _1660;
    float _1746 = _1712 * _1680;
    float _1748 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1712 * _1672;
    float _1758 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1754;
    float _1768 = fma(_1766, _1736, 1.0);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1772 = -_1756;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1776 = exp2(_1764);
    float _1778 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1786 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = log2(_1768);
    float _1792 = _1746 + 1.0;
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1798 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = 1.0 / _1770;
    float _1804 = -_1746;
    float _1806 = fma(_1776, _1792, _1804);
    float _1808 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1810 = fma(_1788, _1798, -0.212114393711090087890625);
    float _1812 = fma(_1806, 0.5, 0.5);
    float _1814 = fma(_1788, _1810, 1.570728778839111328125);
    float _1816 = sqrt(_1782);
    float _1818 = _1790 * 0.693147182464599609375;
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1800 * _1802;
    float _1824 = _1808 * _1802;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1816 * 0.636619746685028076171875;
    float _1832 = -_1814;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _5111 = float3(_1826, _1828, _1820);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5111, float3(0.0), isnan(_5111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5111, float3(0.0), isnan(_5111)), level(0.0)).x;
    float3 _5122 = float3(_1826, _1828, _1820);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5122, float3(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5122, float3(0.0), isnan(_5122)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5139 = float2(_1834, _1812);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5139, float2(0.0), isnan(_5139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5139, float2(0.0), isnan(_5139)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_51.w;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_59.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1867 = _1865 != 0;
    float _1869 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1871 = in.m_51.x;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1877 = _1875 != 0;
    float _1879 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = in.m_59.x;
    float _1887 = exp2(_1869);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = 0.0;
    if (_1867)
    {
        float _1895 = in.m_51.z;
        _1893 = _1895;
    }
    float _1897 = _1893;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1901 = _1899 != 0;
    float _1903 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1909 = _1859 > 0.5;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1913 = in.m_51.y;
    float _1915 = -_1863;
    float _1917 = _1915 + 1.0;
    float _1919 = _1078 * _1863;
    float _1921 = 1.0 / _1907;
    float _1923 = _1871 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1925 = _1863;
    bool _1927 = _1909;
    float _1929 = _1919;
    if (_1883)
    {
        float _1931 = _1909 ? _1917 : _1863;
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1919;
    float _1937 = _1935 + 1.0;
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = -_1911;
    float _1945 = fma(_1923, 2.0, _1943);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1949 = _1907;
    float _1951 = _1933;
    if (!_1877)
    {
        float _1953 = in.m_51.z;
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1182 * _1885;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1959;
    float _1963 = _1897;
    float _1965 = _1957;
    if (_1867)
    {
        bool _1967 = _1897 > 0.5;
        _1927 = _1967;
    }
    bool _1969 = _1927;
    float _1971 = _1961 * _1921;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1975 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1977 = _1913 > 0.5;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1981 = _1971;
    if (!_1877)
    {
        _1963 = _1913;
    }
    float _1983 = _1963;
    float _1985 = fma(_1975, -2.0, _1947);
    float _1987 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1983;
    if (_1901)
    {
        float _1991 = _1977 ? _1937 : _1919;
        _1929 = _1991;
    }
    float _1993 = _1929;
    float _1995 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1997 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1985);
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = fma(_1987, _1933, -0.5);
    float _2003 = fma(_1995, _1993, -0.5);
    float _2005 = _1955;
    if (!_1877)
    {
        _1951 = _1955;
    }
    float _2007 = _1951;
    float _2009 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2011 = _2007;
    if (_1877)
    {
        _2011 = _1913;
    }
    float _2013 = _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2017 = _1070 + _2015;
    if (_1877)
    {
        _2005 = _1913;
    }
    float _2019 = _2005;
    float _2021 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2009);
    int _2023 = as_type<int>(_2019);
    if (_1877)
    {
        _1989 = _1871;
    }
    float _2025 = _1989;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2029 = fma(_1971, _2017, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2031 = -_1997;
    float _2033 = fma(_2021, _2003, _2031);
    bool _2035 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2037 = isnan(_1070);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1979);
    bool _2049 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2051 = isnan(_1070);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2063 = -_2045;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2069 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1867)
    {
        _1981 = _1885;
    }
    float _2071 = _1981;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2075 = _2059 * _2065;
    float _2077 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2067);
    float _2079 = _2071;
    if (_1867)
    {
        float _2081 = -_1885;
        float _2083 = _2081 + 1.0;
        _2023 = as_type<int>(_2083);
    }
    int _2085 = _2023;
    float _2087 = -_2073;
    float _2089 = fma(_2061, 2.0, _2087);
    float _2091 = _2029 * _2075;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = -_2059;
    float _2097 = _2095 + 1.0;
    if (_1867)
    {
        float _2099 = _1969 ? as_type<float>(_2085) : _1885;
        _2079 = _2099;
    }
    float _2101 = _2079;
    float _2103 = -_1957;
    float _2105 = _2103 + 1.0;
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2091);
    bool _2111 = _1871 > 0.5;
    float _2113 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _2115 = fma(_2069, -2.0, _2107);
    float _2117 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2109);
    if (_1891)
    {
        float _2121 = _2111 ? _2105 : _1957;
        _1965 = _2121;
    }
    float _2123 = _1965;
    float _2125 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2047);
    float _2127 = fma(_2117, _2101, -0.5);
    float _2129 = -_122;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1945);
    float _2133 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_122;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2089);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2113);
    float _2143 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = fma(_2135, _2123, -0.5);
    float _2147 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _2149 = fma(_2125, _2127, _2139);
    float _2151 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2153 = fma(_2141, _2145, _2131);
    float _2155 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2147);
    float _2157 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2077);
    float _2159 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2161 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2169 = _2153 + 0.5;
    float _2171 = _2155 + _1770;
    float _2173 = _1800 + _1770;
    float _2175 = _1770 * 0.5;
    out.m_63.x = _2161;
    out.m_63.y = _2163;
    out.m_63.z = _2165;
    out.m_63.w = _2167;
    float _2177 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2179 = _1520 > 0.0;
    bool _2181 = isnan(_1520);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = -_2159;
    float _2191 = fma(_2157, _2001, _2189);
    float _2193 = _2033 + 0.5;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1770;
    float _2195 = _2149 + 0.5;
    float _2197 = _2191 + 0.5;
    out.m_65.x = _2169;
    out.m_65.y = _2193;
    out.m_65.z = _2195;
    out.m_65.w = _2197;
    float _2199 = _2171 * 0.5;
    float _2201 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2203 = _2173 * 0.5;
    float _2205 = fma(_1808, -0.5, _2175);
    float _2207 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    out.m_45.x = _2207;
    out.m_67.x = _2203;
    out.m_67.y = _2205;
    out.m_67.z = _2199;
    out.m_67.w = _1770;
    float _2213 = _2201 * _1836;
    float _2215 = _1847 * _2211;
    float _2217 = _1847 * _2213;
    float _2219 = _1857 * _2213;
    float _2221 = fma(_1853, _2217, _1841);
    float _2223 = fma(_1855, _2217, _1843);
    float _2225 = fma(_1847, _2219, _1845);
    out.m_69.x = _2221;
    out.m_69.y = _2223;
    out.m_69.z = _2225;
    out.m_69.w = _2215;
    if (_2187)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2227;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2352 = as_type<float>(_140);
        out.gl_Position.z = _2352;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _320 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _318);
    float _328 = fma(_320, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _382;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = 1.0 / _390;
    float _416 = _334 * _370;
    float _418 = _410 * _392;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _332 * _368;
    bool _438 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _440 = isnan(_364);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = _364 + _450;
    float _454 = 1.0 / _386;
    float _456 = _422 * _406;
    float _458 = -_434;
    float _460 = _458 + 1.0;
    float _462 = _330 * _366;
    float _464 = _448 * _460;
    float _466 = -_448;
    float _468 = _466 + 1.0;
    float _470 = _374 * _414;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _452 * _454;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _418, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _418, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _418, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _404 * _490;
    float _528 = -_404;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _456, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _456, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _456, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = _510 * _542;
    float _550 = _512 * _542;
    float _552 = -_524;
    float _554 = _552 + 1.0;
    float _556 = _504 * _542;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _570 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_560, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_544, _526, _566);
    float _580 = fma(_540, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _592 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_576, _492, _578);
    float _602 = fma(_586, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_592, _492, _580);
    float _610 = fma(_594, _492, _582);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_412;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = 1.0 / _672;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = _690 * _686;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _652 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _724 = _652 + _722;
    float _726 = fma(_716, _720, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _728 = _684 * _694;
    float _730 = -_684;
    float _732 = _730 + 1.0;
    float _734 = _714 * _710;
    float _736 = -_706;
    float _738 = _736 + 1.0;
    float _740 = _726 * _728;
    float _742 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = fma(_734, _724, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _746 = _668 * _738;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_744, _746, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _758;
    out.m_55.z = _752;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _824 = 1.0 / _810;
    float _826 = 1.0 / _822;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _830 = _794 + _828;
    bool _832 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _834 = 1.0 / _818;
    float _836 = _798 * _824;
    bool _838 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _840 = isnan(_794);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_794);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _814;
    float _864 = _830 * _826;
    bool _866 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _868 = isnan(_794);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_876;
    float _880 = _878 + 1.0;
    float _882 = _802 * _834;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _896;
    float _900 = _848 * _880;
    bool _902 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _904 = isnan(_794);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_848;
    float _916 = _914 + 1.0;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    float _922 = fma(_898, _836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _924 = _806 * _862;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _912 * _920;
    float _936 = -_912;
    float _938 = _936 + 1.0;
    float _940 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _944 = _894 * _916;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = _860 * _938;
    float _960 = fma(_948, _924, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = fma(_952, _924, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _964 = fma(_956, _924, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _966 = _940 * _958;
    float _968 = _942 * _958;
    float _970 = _922 * _958;
    float _972 = -_860;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _970);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _994 = fma(_978, _882, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_960, _934, _988);
    float _998 = fma(_964, _934, _990);
    float _1000 = fma(_982, _882, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1002 = fma(_962, _934, _992);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1012 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _944, _996);
    float _1020 = fma(_1006, _864, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1010, _864, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_1000, _944, _1002);
    float _1026 = fma(_1016, _864, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_1012, _944, _998);
    float _1030 = fma(_1020, _900, _1018);
    float _1032 = fma(_1022, _900, _1024);
    float _1034 = fma(_1026, _900, _1028);
    float _1036 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_832;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1078 * _1178;
    float _1186 = _1080 * _1180;
    float _1188 = _1154 * _1174;
    float _1190 = _1148 * _1174;
    float _1192 = _1160 * _1174;
    float _1194 = _1182 * _1176;
    float _1196 = _1130 * _1188;
    float _1198 = _1128 * _1190;
    float _1200 = -_1196;
    float _1202 = fma(_1126, _1190, _1200);
    float _1204 = -_1198;
    float _1206 = fma(_1130, _1192, _1204);
    float _1208 = _1184 * _1202;
    float _1210 = _1184 * _1206;
    float _1212 = fma(_1194, _1192, _1208);
    float _1214 = fma(_1194, _1188, _1210);
    float _1216 = fma(_1186, _1128, _1212);
    float _1218 = fma(_1186, _1126, _1214);
    float _1220 = _1126 * _1192;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1188, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1184 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1194, _1190, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1186, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1190;
    float _1258 = _1224;
    float _1260 = _1100;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1282 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = fma(_1236, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1306 = fma(_1232, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1308 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1310 = fma(_1250, _1296, _1308);
        _1274 = _1310;
        _1264 = _1304;
        _1268 = _1306;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1324, _1324, _1332);
    float _1346 = fma(_1328, _1328, _1344);
    float _1348 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1350 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1348);
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1350);
    float _1358 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1360 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1356);
    float _1362 = 1.0 / _1358;
    float _1364 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1366 = _1364 + _1358;
    bool _1368 = _1352 > 0.0;
    float _1370 = _1352;
    float _1372 = _1314;
    float _1374 = _1316;
    float _1376 = _1346;
    float _1378 = _1312;
    if (_1342)
    {
        _1370 = 1.0;
    }
    float _1380 = _1370;
    float _1382 = _1366 * _1362;
    float _1384 = _1382 * 0.5;
    float _1386 = _1384;
    float _1388 = _1380;
    if (!_1368)
    {
        _1260 = _1312;
    }
    float _1390 = _1260;
    bool _1392 = !_1368;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = _164 * _164;
        float _1398 = fma(_162, _162, _1396);
        float _1400 = fma(_166, _166, _1398);
        float _1402 = rsqrt(_1346);
        float _1404 = sqrt(_1400);
        float _1406 = _1324 * _1402;
        float _1408 = _1328 * _1402;
        bool _1410 = _1404 > 0.0;
        float _1412 = _1320 * _1402;
        float _1414 = _1402;
        if (!_1410)
        {
            _1414 = _1312;
        }
        float _1416 = _1414;
        bool _1418 = !_1410;
        _1394 = _1416;
        if (!_1418)
        {
            float _1420 = rsqrt(_1400);
            float _1422 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1424 = _164 * _1420;
            float _1426 = _162 * _1420;
            float _1428 = _1412 * _1424;
            float _1430 = _166 * _1420;
            float _1432 = fma(_1406, _1426, _1428);
            float _1434 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1436 = fma(_1408, _1430, _1432);
            float _1438 = _1436 * _1434;
            float _1440 = fma(_162, _1438, _1314);
            float _1442 = fma(_164, _1438, _1312);
            float _1444 = fma(_166, _1438, _1316);
            _1394 = _1442;
            _1372 = _1440;
            _1374 = _1444;
            _1376 = _1438;
        }
    }
    float _1446 = _1394;
    float _1448 = _1372;
    float _1450 = _1374;
    float _1452 = _1376;
    float _1454 = _1452;
    if (!_1342)
    {
        float _1456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1458 = _1456 * 0.15915493667125701904296875;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1462);
        float _1466 = _1458 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1460 * 0.15915493667125701904296875;
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1464;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = 1.0 / _1488;
        float _1498 = 1.0 / _1494;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = _1490 * _1500;
        float _1504 = _1486 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1502, _1506);
        float _1510 = _1508 * _1498;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1458;
        _1386 = _1490;
        _1378 = _1470;
        _1388 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1386;
    float _1518 = _1378;
    float _1520 = _1388;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1446 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1448 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1450 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1544 = _1528 * _1542;
    float _1546 = _1532 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _1514;
    float _1564 = _1560;
    float _1566 = _1516;
    float _1568 = _1524;
    float _1570 = _1542;
    float _1572 = _1544;
    if (_1556)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1574;
    }
    float _1576 = _1562;
    float _1578 = _1576;
    if (_1556)
    {
        float _1580 = _1560 * _1576;
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1556)
    {
        float _1584 = rsqrt(_1552);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1556)
    {
        float _1590 = _1582 * 0.15915493667125701904296875;
        _1566 = _1590;
    }
    float _1592 = _1566;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = _1532;
    if (_1556)
    {
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = precise::max(0.0, _1594);
    float _1606 = _1518;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = sqrt(_1538);
    float _1628 = _1602;
    float _1630 = _1624;
    if (_1556)
    {
        float _1632 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = _1634;
    if (!_1556)
    {
        _1630 = _1548;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (_1556)
    {
        float _1642 = _1586 * _1634;
        _1570 = _1642;
    }
    float _1644 = _1570;
    if (!_1556)
    {
        _1636 = _1620;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    float _1650 = _1614;
    if (_1556)
    {
        float _1652 = _1614 + (-1.0);
        _1608 = _1652;
    }
    float _1654 = _1608;
    float _1656 = _1654;
    if (_1556)
    {
        float _1658 = _1544 * _1644;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1662;
    }
    float _1664 = _1588;
    if (!_1556)
    {
        _1656 = _1546;
    }
    float _1666 = _1656;
    float _1668 = _1666;
    if (_1556)
    {
        float _1670 = _1546 * _1644;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1556)
    {
        float _1674 = _1660 * _1660;
        _1640 = _1674;
    }
    float _1676 = _1640;
    if (_1556)
    {
        float _1678 = fma(_1620, _1614, _1664);
        _1648 = _1678;
    }
    float _1680 = _1648;
    if (!_1556)
    {
        _1650 = _1550;
    }
    float _1682 = _1650;
    float _1684 = _1682;
    if (_1556)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1680, _1680, _1676);
    float _1692 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1694 = _1690 + _1688;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1692);
    float _1704 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = rsqrt(_1694);
    float _1714 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1716 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1718 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1706);
    float _1724 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1716);
    float _1726 = abs(_1710);
    float _1728 = log2(_1726);
    float _1730 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1718);
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1738 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1712 * _1660;
    float _1746 = _1712 * _1680;
    float _1748 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1712 * _1672;
    float _1758 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1754;
    float _1768 = fma(_1766, _1736, 1.0);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1772 = -_1756;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1776 = exp2(_1764);
    float _1778 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1786 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = log2(_1768);
    float _1792 = _1746 + 1.0;
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1798 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = 1.0 / _1770;
    float _1804 = -_1746;
    float _1806 = fma(_1776, _1792, _1804);
    float _1808 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1810 = fma(_1788, _1798, -0.212114393711090087890625);
    float _1812 = fma(_1806, 0.5, 0.5);
    float _1814 = fma(_1788, _1810, 1.570728778839111328125);
    float _1816 = sqrt(_1782);
    float _1818 = _1790 * 0.693147182464599609375;
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1800 * _1802;
    float _1824 = _1808 * _1802;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1816 * 0.636619746685028076171875;
    float _1832 = -_1814;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _5111 = float3(_1826, _1828, _1820);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5111, float3(0.0), isnan(_5111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5111, float3(0.0), isnan(_5111)), level(0.0)).x;
    float3 _5122 = float3(_1826, _1828, _1820);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5122, float3(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5122, float3(0.0), isnan(_5122)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5139 = float2(_1834, _1812);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5139, float2(0.0), isnan(_5139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5139, float2(0.0), isnan(_5139)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_51.w;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_59.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1867 = _1865 != 0;
    float _1869 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1871 = in.m_51.x;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1877 = _1875 != 0;
    float _1879 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = in.m_59.x;
    float _1887 = exp2(_1869);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = 0.0;
    if (_1867)
    {
        float _1895 = in.m_51.z;
        _1893 = _1895;
    }
    float _1897 = _1893;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1901 = _1899 != 0;
    float _1903 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1909 = _1859 > 0.5;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1913 = in.m_51.y;
    float _1915 = -_1863;
    float _1917 = _1915 + 1.0;
    float _1919 = _1078 * _1863;
    float _1921 = 1.0 / _1907;
    float _1923 = _1871 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1925 = _1863;
    bool _1927 = _1909;
    float _1929 = _1919;
    if (_1883)
    {
        float _1931 = _1909 ? _1917 : _1863;
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1919;
    float _1937 = _1935 + 1.0;
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = -_1911;
    float _1945 = fma(_1923, 2.0, _1943);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1949 = _1907;
    float _1951 = _1933;
    if (!_1877)
    {
        float _1953 = in.m_51.z;
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1182 * _1885;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1959;
    float _1963 = _1897;
    float _1965 = _1957;
    if (_1867)
    {
        bool _1967 = _1897 > 0.5;
        _1927 = _1967;
    }
    bool _1969 = _1927;
    float _1971 = _1961 * _1921;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1975 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1977 = _1913 > 0.5;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1981 = _1971;
    if (!_1877)
    {
        _1963 = _1913;
    }
    float _1983 = _1963;
    float _1985 = fma(_1975, -2.0, _1947);
    float _1987 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1983;
    if (_1901)
    {
        float _1991 = _1977 ? _1937 : _1919;
        _1929 = _1991;
    }
    float _1993 = _1929;
    float _1995 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1997 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1985);
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = fma(_1987, _1933, -0.5);
    float _2003 = fma(_1995, _1993, -0.5);
    float _2005 = _1955;
    if (!_1877)
    {
        _1951 = _1955;
    }
    float _2007 = _1951;
    float _2009 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2011 = _2007;
    if (_1877)
    {
        _2011 = _1913;
    }
    float _2013 = _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2017 = _1070 + _2015;
    if (_1877)
    {
        _2005 = _1913;
    }
    float _2019 = _2005;
    float _2021 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2009);
    int _2023 = as_type<int>(_2019);
    if (_1877)
    {
        _1989 = _1871;
    }
    float _2025 = _1989;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2029 = fma(_1971, _2017, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2031 = -_1997;
    float _2033 = fma(_2021, _2003, _2031);
    bool _2035 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2037 = isnan(_1070);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1979);
    bool _2049 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2051 = isnan(_1070);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2063 = -_2045;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2069 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1867)
    {
        _1981 = _1885;
    }
    float _2071 = _1981;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2075 = _2059 * _2065;
    float _2077 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2067);
    float _2079 = _2071;
    if (_1867)
    {
        float _2081 = -_1885;
        float _2083 = _2081 + 1.0;
        _2023 = as_type<int>(_2083);
    }
    int _2085 = _2023;
    float _2087 = -_2073;
    float _2089 = fma(_2061, 2.0, _2087);
    float _2091 = _2029 * _2075;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = -_2059;
    float _2097 = _2095 + 1.0;
    if (_1867)
    {
        float _2099 = _1969 ? as_type<float>(_2085) : _1885;
        _2079 = _2099;
    }
    float _2101 = _2079;
    float _2103 = -_1957;
    float _2105 = _2103 + 1.0;
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2091);
    bool _2111 = _1871 > 0.5;
    float _2113 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _2115 = fma(_2069, -2.0, _2107);
    float _2117 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2109);
    if (_1891)
    {
        float _2121 = _2111 ? _2105 : _1957;
        _1965 = _2121;
    }
    float _2123 = _1965;
    float _2125 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2047);
    float _2127 = fma(_2117, _2101, -0.5);
    float _2129 = -_122;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1945);
    float _2133 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_122;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2089);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2113);
    float _2143 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = fma(_2135, _2123, -0.5);
    float _2147 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _2149 = fma(_2125, _2127, _2139);
    float _2151 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2153 = fma(_2141, _2145, _2131);
    float _2155 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2147);
    float _2157 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2077);
    float _2159 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2161 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2169 = _2153 + 0.5;
    float _2171 = _2155 + _1770;
    float _2173 = _1800 + _1770;
    float _2175 = _1770 * 0.5;
    out.m_63.x = _2161;
    out.m_63.y = _2163;
    out.m_63.z = _2165;
    out.m_63.w = _2167;
    float _2177 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2179 = _1520 > 0.0;
    bool _2181 = isnan(_1520);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = -_2159;
    float _2191 = fma(_2157, _2001, _2189);
    float _2193 = _2033 + 0.5;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1770;
    float _2195 = _2149 + 0.5;
    float _2197 = _2191 + 0.5;
    out.m_65.x = _2169;
    out.m_65.y = _2193;
    out.m_65.z = _2195;
    out.m_65.w = _2197;
    float _2199 = _2171 * 0.5;
    float _2201 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2203 = _2173 * 0.5;
    float _2205 = fma(_1808, -0.5, _2175);
    float _2207 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    out.m_45.x = _2207;
    out.m_67.x = _2203;
    out.m_67.y = _2205;
    out.m_67.z = _2199;
    out.m_67.w = _1770;
    float _2213 = _2201 * _1836;
    float _2215 = _1847 * _2211;
    float _2217 = _1847 * _2213;
    float _2219 = _1857 * _2213;
    float _2221 = fma(_1853, _2217, _1841);
    float _2223 = fma(_1855, _2217, _1843);
    float _2225 = fma(_1847, _2219, _1845);
    out.m_69.x = _2221;
    out.m_69.y = _2223;
    out.m_69.z = _2225;
    out.m_69.w = _2215;
    if (_2187)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2227;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1062 = false;
    bool _786 = false;
    bool _644 = false;
    bool _356 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2284 = as_type<float>(_104);
        out.gl_Position.z = _2284;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2352 = as_type<float>(_140);
        out.gl_Position.z = _2352;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    bool _214 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_196);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = 1.0 / _228;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _232;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _240;
    float _244 = _200 * _234;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_212;
    float _264 = _262 + 1.0;
    float _266 = fma(_242, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _260 * _264;
    float _270 = -_260;
    float _272 = _270 + 1.0;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _248 * _238;
    float _284 = _224 * _272;
    float _286 = fma(_276, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = -_224;
    float _292 = _290 + 1.0;
    float _294 = _266 * _284;
    float _296 = _286 * _284;
    float _298 = _288 * _284;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _312 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _314 = fma(_302, _282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_306, _282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _320 = fma(_310, _282, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _324 = fma(_314, _268, _312);
    float _326 = fma(_316, _268, _318);
    float _328 = fma(_320, _268, _322);
    float _330 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].x, _324);
    float _332 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].y, _326);
    float _334 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[145].z, _328);
    bool _336 = !_236;
    float _354;
    if (!_336)
    {
        float _338 = in.m_51.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_88);
        float _360 = 1.0 / _358;
        float _362 = _122 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_53.x;
    float _368 = in.m_53.y;
    float _370 = in.m_53.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = 1.0 / _378;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _382;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _414 = 1.0 / _390;
    float _416 = _334 * _370;
    float _418 = _410 * _392;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _422 = _364 + _420;
    bool _424 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_364);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _332 * _368;
    bool _438 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _440 = isnan(_364);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = _364 + _450;
    float _454 = 1.0 / _386;
    float _456 = _422 * _406;
    float _458 = -_434;
    float _460 = _458 + 1.0;
    float _462 = _330 * _366;
    float _464 = _448 * _460;
    float _466 = -_448;
    float _468 = _466 + 1.0;
    float _470 = _374 * _414;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _484;
    float _488 = -_482;
    float _490 = _488 + 1.0;
    float _492 = _482 * _468;
    float _494 = _452 * _454;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _500;
    float _504 = fma(_486, _418, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = fma(_498, _418, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_502, _418, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _514 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _516 = isnan(_364);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _404 * _490;
    float _528 = -_404;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = fma(_508, _456, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = _524 * _530;
    float _544 = fma(_534, _456, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_538, _456, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = _510 * _542;
    float _550 = _512 * _542;
    float _552 = -_524;
    float _554 = _552 + 1.0;
    float _556 = _504 * _542;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _558;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _562;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _568 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _570 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[107].z, _556);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _572;
    float _576 = fma(_560, _494, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _578 = fma(_544, _526, _566);
    float _580 = fma(_540, _526, _568);
    float _582 = fma(_546, _526, _570);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _590 = _588 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _592 = fma(_564, _494, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _594 = fma(_574, _494, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _600 = fma(_576, _492, _578);
    float _602 = fma(_586, _470, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _604 = fma(_590, _470, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _606 = fma(_598, _470, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _608 = fma(_592, _492, _580);
    float _610 = fma(_594, _492, _582);
    float _612 = fma(_602, _464, _600);
    float _614 = fma(_604, _464, _608);
    float _616 = fma(_606, _464, _610);
    float _618 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].x, _612);
    float _620 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].y, _614);
    float _622 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[111].z, _616);
    bool _624 = !_412;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_88);
        float _648 = 1.0 / _646;
        float _650 = _122 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _660 = isnan(_652);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _676 = isnan(_652);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _656;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _688;
    float _692 = -_668;
    float _694 = _692 + 1.0;
    bool _696 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _698 = isnan(_652);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    bool _708 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _710 = 1.0 / _672;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _716 = _690 * _686;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _652 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _724 = _652 + _722;
    float _726 = fma(_716, _720, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _728 = _684 * _694;
    float _730 = -_684;
    float _732 = _730 + 1.0;
    float _734 = _714 * _710;
    float _736 = -_706;
    float _738 = _736 + 1.0;
    float _740 = _726 * _728;
    float _742 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = fma(_734, _724, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _746 = _668 * _738;
    float _748 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[115].x, _740);
    float _750 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _752 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = fma(_744, _746, _748);
    float _756 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _758 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[117].x, _754);
    float _762 = _756 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _762;
    out.m_55.y = _758;
    out.m_55.z = _752;
    out.m_55.w = _764;
    bool _766 = !_708;
    float _784;
    if (!_766)
    {
        float _768 = in.m_51.x;
        float _770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _772 = _768 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _774 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _776 = _774 * _770;
        float _778 = floor(_776);
        float _780 = -_778;
        float _782 = _776 + _780;
        _784 = _782;
        _786 = true;
    }
    else
    {
        float _788 = float(_88);
        float _790 = 1.0 / _788;
        float _792 = _122 * _790;
        _784 = _792;
    }
    _786 = false;
    float _794 = _784;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _798 = _794 + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _794 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _806 = _794 + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _816;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _824 = 1.0 / _810;
    float _826 = 1.0 / _822;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _830 = _794 + _828;
    bool _832 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _834 = 1.0 / _818;
    float _836 = _798 * _824;
    bool _838 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _840 = isnan(_794);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_794);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = 1.0 / _814;
    float _864 = _830 * _826;
    bool _866 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _868 = isnan(_794);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _874 = _870 || _872;
    float _876 = float(_874);
    float _878 = -_876;
    float _880 = _878 + 1.0;
    float _882 = _802 * _834;
    bool _884 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _886 = isnan(_794);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _896;
    float _900 = _848 * _880;
    bool _902 = _794 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _904 = isnan(_794);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_848;
    float _916 = _914 + 1.0;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    float _922 = fma(_898, _836, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _924 = _806 * _862;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _930;
    float _934 = _912 * _920;
    float _936 = -_912;
    float _938 = _936 + 1.0;
    float _940 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _944 = _894 * _916;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _958 = _860 * _938;
    float _960 = fma(_948, _924, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = fma(_952, _924, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _964 = fma(_956, _924, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _966 = _940 * _958;
    float _968 = _942 * _958;
    float _970 = _922 * _958;
    float _972 = -_860;
    float _974 = _972 + 1.0;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _984;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _990 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].z, _970);
    float _992 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _994 = fma(_978, _882, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _996 = fma(_960, _934, _988);
    float _998 = fma(_964, _934, _990);
    float _1000 = fma(_982, _882, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1002 = fma(_962, _934, _992);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1012 = fma(_986, _882, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1018 = fma(_994, _944, _996);
    float _1020 = fma(_1006, _864, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1022 = fma(_1010, _864, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1024 = fma(_1000, _944, _1002);
    float _1026 = fma(_1016, _864, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_1012, _944, _998);
    float _1030 = fma(_1020, _900, _1018);
    float _1032 = fma(_1022, _900, _1024);
    float _1034 = fma(_1026, _900, _1028);
    float _1036 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1030);
    float _1038 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1032);
    float _1040 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1034);
    bool _1042 = !_832;
    float _1060;
    if (!_1042)
    {
        float _1044 = in.m_51.x;
        float _1046 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1048 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1052 = _1050 * _1046;
        float _1054 = floor(_1052);
        float _1056 = -_1054;
        float _1058 = _1052 + _1056;
        _1060 = _1058;
        _1062 = true;
    }
    else
    {
        float _1064 = float(_88);
        float _1066 = 1.0 / _1064;
        float _1068 = _122 * _1066;
        _1060 = _1068;
    }
    _1062 = false;
    float _1070 = _1060;
    float _1072 = in.m_42.x;
    float _1074 = in.m_42.y;
    float _1076 = in.m_42.z;
    float _1078 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1080 = _416 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1086 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1088 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1086);
    float _1094 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1088);
    float _1096 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1090);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1092);
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1102 = _1096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1104 = _1098 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1106 = -_1100;
    float _1108 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1110 = -_1102;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = -_1104;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1118 = _1108 * _1108;
    float _1120 = fma(_1112, _1112, _1118);
    float _1122 = fma(_1116, _1116, _1120);
    float _1124 = rsqrt(_1122);
    float _1126 = _1112 * _1124;
    float _1128 = _1116 * _1124;
    float _1130 = _1108 * _1124;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1134 = _1126 * _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1138 = _1128 * _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1142 = _1130 * _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1146 = -_1134;
    float _1148 = fma(_1128, _1144, _1146);
    float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1152 = -_1138;
    float _1154 = fma(_1130, _1150, _1152);
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1158 = -_1142;
    float _1160 = fma(_1126, _1156, _1158);
    float _1162 = in.m_57.x;
    float _1164 = in.m_57.y;
    float _1166 = in.m_57.z;
    float _1168 = _1148 * _1148;
    float _1170 = fma(_1154, _1154, _1168);
    float _1172 = fma(_1160, _1160, _1170);
    float _1174 = rsqrt(_1172);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1162);
    float _1178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1164);
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1166);
    float _1182 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1184 = _1078 * _1178;
    float _1186 = _1080 * _1180;
    float _1188 = _1154 * _1174;
    float _1190 = _1148 * _1174;
    float _1192 = _1160 * _1174;
    float _1194 = _1182 * _1176;
    float _1196 = _1130 * _1188;
    float _1198 = _1128 * _1190;
    float _1200 = -_1196;
    float _1202 = fma(_1126, _1190, _1200);
    float _1204 = -_1198;
    float _1206 = fma(_1130, _1192, _1204);
    float _1208 = _1184 * _1202;
    float _1210 = _1184 * _1206;
    float _1212 = fma(_1194, _1192, _1208);
    float _1214 = fma(_1194, _1188, _1210);
    float _1216 = fma(_1186, _1128, _1212);
    float _1218 = fma(_1186, _1126, _1214);
    float _1220 = _1126 * _1192;
    float _1222 = _1104 + _1216;
    float _1224 = _1102 + _1218;
    float _1226 = -_1220;
    float _1228 = fma(_1128, _1188, _1226);
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1232 = _1222 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1236 = _1224 + _1234;
    float _1238 = _1184 * _1228;
    float _1240 = _1232 * _1232;
    float _1242 = fma(_1194, _1190, _1238);
    float _1244 = fma(_1236, _1236, _1240);
    float _1246 = fma(_1186, _1130, _1242);
    float _1248 = sqrt(_1244);
    float _1250 = _1100 + _1246;
    bool _1252 = _1248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1254 = _1184;
    float _1256 = _1190;
    float _1258 = _1224;
    float _1260 = _1100;
    if (!_1252)
    {
        _1254 = _1224;
    }
    float _1262 = _1254;
    float _1264 = _1262;
    if (!_1252)
    {
        _1256 = _1222;
    }
    float _1266 = _1256;
    float _1268 = _1266;
    if (!_1252)
    {
        _1258 = _1250;
    }
    float _1270 = _1258;
    bool _1272 = !_1252;
    float _1274 = _1270;
    if (!_1272)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1248 + _1278;
        float _1282 = rsqrt(_1244);
        float _1284 = _1280 * _1276;
        float _1286 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1282 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = fma(_1236, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1306 = fma(_1232, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1308 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1310 = fma(_1250, _1296, _1308);
        _1274 = _1310;
        _1264 = _1304;
        _1268 = _1306;
    }
    float _1312 = _1274;
    float _1314 = _1264;
    float _1316 = _1268;
    float _1318 = -_1100;
    float _1320 = _1318 + _1312;
    float _1322 = -_1102;
    float _1324 = _1322 + _1314;
    float _1326 = -_1104;
    float _1328 = _1326 + _1316;
    float _1330 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1332 = _1320 * _1320;
    bool _1334 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1336 = isnan(0.5);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1342 = _1338 || _1340;
    float _1344 = fma(_1324, _1324, _1332);
    float _1346 = fma(_1328, _1328, _1344);
    float _1348 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1330);
    float _1350 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1352 = sqrt(_1346);
    float _1354 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1348);
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1350);
    float _1358 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1360 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1356);
    float _1362 = 1.0 / _1358;
    float _1364 = _1360 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1366 = _1364 + _1358;
    bool _1368 = _1352 > 0.0;
    float _1370 = _1352;
    float _1372 = _1314;
    float _1374 = _1316;
    float _1376 = _1346;
    float _1378 = _1312;
    if (_1342)
    {
        _1370 = 1.0;
    }
    float _1380 = _1370;
    float _1382 = _1366 * _1362;
    float _1384 = _1382 * 0.5;
    float _1386 = _1384;
    float _1388 = _1380;
    if (!_1368)
    {
        _1260 = _1312;
    }
    float _1390 = _1260;
    bool _1392 = !_1368;
    float _1394 = _1390;
    if (!_1392)
    {
        float _1396 = _164 * _164;
        float _1398 = fma(_162, _162, _1396);
        float _1400 = fma(_166, _166, _1398);
        float _1402 = rsqrt(_1346);
        float _1404 = sqrt(_1400);
        float _1406 = _1324 * _1402;
        float _1408 = _1328 * _1402;
        bool _1410 = _1404 > 0.0;
        float _1412 = _1320 * _1402;
        float _1414 = _1402;
        if (!_1410)
        {
            _1414 = _1312;
        }
        float _1416 = _1414;
        bool _1418 = !_1410;
        _1394 = _1416;
        if (!_1418)
        {
            float _1420 = rsqrt(_1400);
            float _1422 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1424 = _164 * _1420;
            float _1426 = _162 * _1420;
            float _1428 = _1412 * _1424;
            float _1430 = _166 * _1420;
            float _1432 = fma(_1406, _1426, _1428);
            float _1434 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1436 = fma(_1408, _1430, _1432);
            float _1438 = _1436 * _1434;
            float _1440 = fma(_162, _1438, _1314);
            float _1442 = fma(_164, _1438, _1312);
            float _1444 = fma(_166, _1438, _1316);
            _1394 = _1442;
            _1372 = _1440;
            _1374 = _1444;
            _1376 = _1438;
        }
    }
    float _1446 = _1394;
    float _1448 = _1372;
    float _1450 = _1374;
    float _1452 = _1376;
    float _1454 = _1452;
    if (!_1342)
    {
        float _1456 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1458 = _1456 * 0.15915493667125701904296875;
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1464 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1462);
        float _1466 = _1458 * 6.283185482025146484375;
        float _1468 = cos(_1466);
        float _1470 = _1460 * 0.15915493667125701904296875;
        float _1472 = _1458 * 6.283185482025146484375;
        float _1474 = sin(_1472);
        float _1476 = 1.0 / _1468;
        float _1478 = _1470 * 6.283185482025146484375;
        float _1480 = cos(_1478);
        float _1482 = _1474 * _1476;
        float _1484 = _1470 * 6.283185482025146484375;
        float _1486 = sin(_1484);
        float _1488 = _1480 * _1482;
        float _1490 = 1.0 / _1464;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1492;
        float _1496 = 1.0 / _1488;
        float _1498 = 1.0 / _1494;
        float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1502 = _1490 * _1500;
        float _1504 = _1486 * _1496;
        float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1508 = fma(_1504, _1502, _1506);
        float _1510 = _1508 * _1498;
        float _1512 = precise::clamp(_1510, 0.0, 1.0);
        _1454 = _1458;
        _1386 = _1490;
        _1378 = _1470;
        _1388 = _1512;
    }
    float _1514 = _1454;
    float _1516 = _1386;
    float _1518 = _1378;
    float _1520 = _1388;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1446 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1448 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1450 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1544 = _1528 * _1542;
    float _1546 = _1532 * _1542;
    float _1548 = _1544 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 + _1550;
    float _1554 = sqrt(_1552);
    bool _1556 = _1554 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = _1554 + _1558;
    float _1562 = _1514;
    float _1564 = _1560;
    float _1566 = _1516;
    float _1568 = _1524;
    float _1570 = _1542;
    float _1572 = _1544;
    if (_1556)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1562 = _1574;
    }
    float _1576 = _1562;
    float _1578 = _1576;
    if (_1556)
    {
        float _1580 = _1560 * _1576;
        _1564 = _1580;
    }
    float _1582 = _1564;
    if (_1556)
    {
        float _1584 = rsqrt(_1552);
        _1578 = _1584;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (_1556)
    {
        float _1590 = _1582 * 0.15915493667125701904296875;
        _1566 = _1590;
    }
    float _1592 = _1566;
    float _1594 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1596 = _1532;
    if (_1556)
    {
        float _1598 = _1592 * 6.283185482025146484375;
        float _1600 = sin(_1598);
        _1596 = _1600;
    }
    float _1602 = _1596;
    float _1604 = precise::max(0.0, _1594);
    float _1606 = _1518;
    float _1608 = _1604;
    if (_1556)
    {
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1542;
    float _1618 = -_1604;
    float _1620 = fma(_1524, _1616, _1618);
    if (_1556)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1568 = _1622;
    }
    float _1624 = _1568;
    float _1626 = sqrt(_1538);
    float _1628 = _1602;
    float _1630 = _1624;
    if (_1556)
    {
        float _1632 = fma(_1602, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1628 = _1632;
    }
    float _1634 = _1628;
    float _1636 = _1634;
    if (!_1556)
    {
        _1630 = _1548;
    }
    float _1638 = _1630;
    float _1640 = _1638;
    if (_1556)
    {
        float _1642 = _1586 * _1634;
        _1570 = _1642;
    }
    float _1644 = _1570;
    if (!_1556)
    {
        _1636 = _1620;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    float _1650 = _1614;
    if (_1556)
    {
        float _1652 = _1614 + (-1.0);
        _1608 = _1652;
    }
    float _1654 = _1608;
    float _1656 = _1654;
    if (_1556)
    {
        float _1658 = _1544 * _1644;
        _1572 = _1658;
    }
    float _1660 = _1572;
    if (_1556)
    {
        float _1662 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1662;
    }
    float _1664 = _1588;
    if (!_1556)
    {
        _1656 = _1546;
    }
    float _1666 = _1656;
    float _1668 = _1666;
    if (_1556)
    {
        float _1670 = _1546 * _1644;
        _1668 = _1670;
    }
    float _1672 = _1668;
    if (_1556)
    {
        float _1674 = _1660 * _1660;
        _1640 = _1674;
    }
    float _1676 = _1640;
    if (_1556)
    {
        float _1678 = fma(_1620, _1614, _1664);
        _1648 = _1678;
    }
    float _1680 = _1648;
    if (!_1556)
    {
        _1650 = _1550;
    }
    float _1682 = _1650;
    float _1684 = _1682;
    if (_1556)
    {
        float _1686 = _1672 * _1672;
        _1684 = _1686;
    }
    float _1688 = _1684;
    float _1690 = fma(_1680, _1680, _1676);
    float _1692 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1694 = _1690 + _1688;
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1698 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1696);
    float _1700 = precise::clamp(_1698, 0.0, 1.0);
    float _1702 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1692);
    float _1704 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1708 = -_1700;
    float _1710 = _1708 + 1.0;
    float _1712 = rsqrt(_1694);
    float _1714 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1716 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1718 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1720 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1706);
    float _1724 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1716);
    float _1726 = abs(_1710);
    float _1728 = log2(_1726);
    float _1730 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1718);
    float _1732 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1736 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1738 = fma(_1450, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    float _1740 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1744 = _1712 * _1660;
    float _1746 = _1712 * _1680;
    float _1748 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1742);
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1712 * _1672;
    float _1758 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1750);
    float _1760 = -_1752;
    float _1762 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1760);
    float _1764 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = -_1754;
    float _1768 = fma(_1766, _1736, 1.0);
    float _1770 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1772 = -_1756;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1762);
    float _1776 = exp2(_1764);
    float _1778 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1786 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1780);
    float _1788 = fma(_1774, 0.5, 0.5);
    float _1790 = log2(_1768);
    float _1792 = _1746 + 1.0;
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1784);
    float _1796 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1798 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = 1.0 / _1770;
    float _1804 = -_1746;
    float _1806 = fma(_1776, _1792, _1804);
    float _1808 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1796);
    float _1810 = fma(_1788, _1798, -0.212114393711090087890625);
    float _1812 = fma(_1806, 0.5, 0.5);
    float _1814 = fma(_1788, _1810, 1.570728778839111328125);
    float _1816 = sqrt(_1782);
    float _1818 = _1790 * 0.693147182464599609375;
    float _1820 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = _1800 * _1802;
    float _1824 = _1808 * _1802;
    float _1826 = fma(_1822, 0.5, 0.5);
    float _1828 = fma(_1824, -0.5, 0.5);
    float _1830 = _1816 * 0.636619746685028076171875;
    float _1832 = -_1814;
    float _1834 = fma(_1830, _1832, 1.0);
    float3 _5111 = float3(_1826, _1828, _1820);
    float _1836 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5111, float3(0.0), isnan(_5111)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5111, float3(0.0), isnan(_5111)), level(0.0)).x;
    float3 _5122 = float3(_1826, _1828, _1820);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5122, float3(0.0), isnan(_5122)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5122, float3(0.0), isnan(_5122)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5139 = float2(_1834, _1812);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5139, float2(0.0), isnan(_5139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5139, float2(0.0), isnan(_5139)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_51.w;
    float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1863 = in.m_59.y;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1867 = _1865 != 0;
    float _1869 = _1728 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1871 = in.m_51.x;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1877 = _1875 != 0;
    float _1879 = _1734 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = in.m_59.x;
    float _1887 = exp2(_1869);
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1891 = _1889 != 0;
    float _1893 = 0.0;
    if (_1867)
    {
        float _1895 = in.m_51.z;
        _1893 = _1895;
    }
    float _1897 = _1893;
    int _1899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1901 = _1899 != 0;
    float _1903 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1879);
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1909 = _1859 > 0.5;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1913 = in.m_51.y;
    float _1915 = -_1863;
    float _1917 = _1915 + 1.0;
    float _1919 = _1078 * _1863;
    float _1921 = 1.0 / _1907;
    float _1923 = _1871 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1925 = _1863;
    bool _1927 = _1909;
    float _1929 = _1919;
    if (_1883)
    {
        float _1931 = _1909 ? _1917 : _1863;
        _1925 = _1931;
    }
    float _1933 = _1925;
    float _1935 = -_1919;
    float _1937 = _1935 + 1.0;
    float _1939 = -_1887;
    float _1941 = _1939 + 1.0;
    float _1943 = -_1911;
    float _1945 = fma(_1923, 2.0, _1943);
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1949 = _1907;
    float _1951 = _1933;
    if (!_1877)
    {
        float _1953 = in.m_51.z;
        _1949 = _1953;
    }
    float _1955 = _1949;
    float _1957 = _1182 * _1885;
    float _1959 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1959;
    float _1963 = _1897;
    float _1965 = _1957;
    if (_1867)
    {
        bool _1967 = _1897 > 0.5;
        _1927 = _1967;
    }
    bool _1969 = _1927;
    float _1971 = _1961 * _1921;
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1975 = _1913 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1977 = _1913 > 0.5;
    float _1979 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1981 = _1971;
    if (!_1877)
    {
        _1963 = _1913;
    }
    float _1983 = _1963;
    float _1985 = fma(_1975, -2.0, _1947);
    float _1987 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1989 = _1983;
    if (_1901)
    {
        float _1991 = _1977 ? _1937 : _1919;
        _1929 = _1991;
    }
    float _1993 = _1929;
    float _1995 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1997 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1985);
    float _1999 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2001 = fma(_1987, _1933, -0.5);
    float _2003 = fma(_1995, _1993, -0.5);
    float _2005 = _1955;
    if (!_1877)
    {
        _1951 = _1955;
    }
    float _2007 = _1951;
    float _2009 = fma(_1913, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1999);
    float _2011 = _2007;
    if (_1877)
    {
        _2011 = _1913;
    }
    float _2013 = _2011;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2017 = _1070 + _2015;
    if (_1877)
    {
        _2005 = _1913;
    }
    float _2019 = _2005;
    float _2021 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2009);
    int _2023 = as_type<int>(_2019);
    if (_1877)
    {
        _1989 = _1871;
    }
    float _2025 = _1989;
    float _2027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2029 = fma(_1971, _2017, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2031 = -_1997;
    float _2033 = fma(_2021, _2003, _2031);
    bool _2035 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2037 = isnan(_1070);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2043 = _2039 || _2041;
    float _2045 = float(_2043);
    float _2047 = fma(_2025, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1979);
    bool _2049 = _1070 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2051 = isnan(_1070);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2063 = -_2045;
    float _2065 = _2063 + 1.0;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2069 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1867)
    {
        _1981 = _1885;
    }
    float _2071 = _1981;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2075 = _2059 * _2065;
    float _2077 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2067);
    float _2079 = _2071;
    if (_1867)
    {
        float _2081 = -_1885;
        float _2083 = _2081 + 1.0;
        _2023 = as_type<int>(_2083);
    }
    int _2085 = _2023;
    float _2087 = -_2073;
    float _2089 = fma(_2061, 2.0, _2087);
    float _2091 = _2029 * _2075;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2095 = -_2059;
    float _2097 = _2095 + 1.0;
    if (_1867)
    {
        float _2099 = _1969 ? as_type<float>(_2085) : _1885;
        _2079 = _2099;
    }
    float _2101 = _2079;
    float _2103 = -_1957;
    float _2105 = _2103 + 1.0;
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2109 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2091);
    bool _2111 = _1871 > 0.5;
    float _2113 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1973);
    float _2115 = fma(_2069, -2.0, _2107);
    float _2117 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2119 = fma(_2045, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2109);
    if (_1891)
    {
        float _2121 = _2111 ? _2105 : _1957;
        _1965 = _2121;
    }
    float _2123 = _1965;
    float _2125 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2047);
    float _2127 = fma(_2117, _2101, -0.5);
    float _2129 = -_122;
    float _2131 = fma(_2129, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1945);
    float _2133 = _1036 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2135 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_122;
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2089);
    float _2141 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2113);
    float _2143 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2145 = fma(_2135, _2123, -0.5);
    float _2147 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1903);
    float _2149 = fma(_2125, _2127, _2139);
    float _2151 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2153 = fma(_2141, _2145, _2131);
    float _2155 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2147);
    float _2157 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2077);
    float _2159 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2161 = _2133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2165 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2167 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2169 = _2153 + 0.5;
    float _2171 = _2155 + _1770;
    float _2173 = _1800 + _1770;
    float _2175 = _1770 * 0.5;
    out.m_63.x = _2161;
    out.m_63.y = _2163;
    out.m_63.z = _2165;
    out.m_63.w = _2167;
    float _2177 = _1520 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2179 = _1520 > 0.0;
    bool _2181 = isnan(_1520);
    bool _2183 = _2179 || _2181;
    bool _2185 = isnan(0.0);
    bool _2187 = _2183 || _2185;
    float _2189 = -_2159;
    float _2191 = fma(_2157, _2001, _2189);
    float _2193 = _2033 + 0.5;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1808;
    out.gl_Position.z = _2155;
    out.gl_Position.w = _1770;
    float _2195 = _2149 + 0.5;
    float _2197 = _2191 + 0.5;
    out.m_65.x = _2169;
    out.m_65.y = _2193;
    out.m_65.z = _2195;
    out.m_65.w = _2197;
    float _2199 = _2171 * 0.5;
    float _2201 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2203 = _2173 * 0.5;
    float _2205 = fma(_1808, -0.5, _2175);
    float _2207 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    out.m_45.x = _2207;
    out.m_67.x = _2203;
    out.m_67.y = _2205;
    out.m_67.z = _2199;
    out.m_67.w = _1770;
    float _2213 = _2201 * _1836;
    float _2215 = _1847 * _2211;
    float _2217 = _1847 * _2213;
    float _2219 = _1857 * _2213;
    float _2221 = fma(_1853, _2217, _1841);
    float _2223 = fma(_1855, _2217, _1843);
    float _2225 = fma(_1847, _2219, _1845);
    out.m_69.x = _2221;
    out.m_69.y = _2223;
    out.m_69.z = _2225;
    out.m_69.w = _2215;
    if (_2187)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2227;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

